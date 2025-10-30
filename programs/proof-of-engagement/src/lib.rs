use anchor_lang::prelude::*;

declare_id!("HifshiXvDF4MwEevZuukURThkjrZFfspn3iP1vdFitdC");

#[program]
pub mod proof_of_engagement {
    use super::*;

    /// Register a new club on the blockchain
    pub fn register_club(
        ctx: Context<RegisterClub>,
        name: String,
        description: String,
    ) -> Result<()> {
        require!(name.len() <= 64, ErrorCode::NameTooLong);
        require!(description.len() <= 256, ErrorCode::DescriptionTooLong);

        let club = &mut ctx.accounts.club;
        club.authority = ctx.accounts.authority.key();
        club.name = name;
        club.description = description;
        club.elo_rating = 1000; // Starting ELO rating
        club.total_events = 0;
        club.total_members = 0;
        club.created_at = Clock::get()?.unix_timestamp;
        club.bump = ctx.bumps.club;

        msg!("Club registered: {}", club.name);
        Ok(())
    }

    /// Create a new event for a club
    pub fn create_event(
        ctx: Context<CreateEvent>,
        event_id: u64,
        name: String,
        description: String,
        location: String,
        start_time: i64,
        end_time: i64,
        max_capacity: u32,
    ) -> Result<()> {
        require!(name.len() <= 64, ErrorCode::NameTooLong);
        require!(description.len() <= 256, ErrorCode::DescriptionTooLong);
        require!(location.len() <= 128, ErrorCode::LocationTooLong);
        require!(start_time > Clock::get()?.unix_timestamp, ErrorCode::InvalidTimestamp);
        require!(end_time > start_time, ErrorCode::InvalidTimestamp);
        require!(max_capacity > 0, ErrorCode::InvalidCapacity);

        let event = &mut ctx.accounts.event;
        event.club = ctx.accounts.club.key();
        event.event_id = event_id;
        event.name = name;
        event.description = description;
        event.location = location;
        event.start_time = start_time;
        event.end_time = end_time;
        event.max_capacity = max_capacity;
        event.current_attendance = 0;
        event.is_active = true;
        event.created_at = Clock::get()?.unix_timestamp;
        event.bump = ctx.bumps.event;

        // Increment club's total events
        let club = &mut ctx.accounts.club;
        club.total_events = club.total_events.checked_add(1).unwrap();

        msg!("Event created: {} for club: {}", event.name, club.name);
        Ok(())
    }

    /// Record attendance for an event with photo proof
    pub fn record_attendance(
        ctx: Context<RecordAttendance>,
        photo_hash: String,
    ) -> Result<()> {
        require!(photo_hash.len() <= 128, ErrorCode::PhotoHashTooLong);
        
        let event = &mut ctx.accounts.event;
        require!(event.is_active, ErrorCode::EventNotActive);
        require!(
            event.current_attendance < event.max_capacity,
            ErrorCode::EventAtCapacity
        );

        let current_time = Clock::get()?.unix_timestamp;
        require!(
            current_time >= event.start_time && current_time <= event.end_time,
            ErrorCode::EventNotInProgress
        );

        let attendance = &mut ctx.accounts.attendance;
        attendance.event = event.key();
        attendance.user = ctx.accounts.user.key();
        attendance.timestamp = current_time;
        attendance.photo_hash = photo_hash;
        attendance.verified = true;
        attendance.bump = ctx.bumps.attendance;

        // Increment event attendance
        event.current_attendance = event.current_attendance.checked_add(1).unwrap();

        msg!(
            "Attendance recorded for user: {} at event: {}",
            ctx.accounts.user.key(),
            event.name
        );
        Ok(())
    }

    /// Update club ELO rating based on event engagement
    pub fn calculate_elo(
        ctx: Context<CalculateElo>,
        engagement_score: u32,
    ) -> Result<()> {
        let club = &mut ctx.accounts.club;
        
        // Simple ELO calculation: engagement_score is based on attendance/capacity ratio
        // engagement_score should be 0-100 representing percentage
        require!(engagement_score <= 100, ErrorCode::InvalidScore);

        let k_factor = 32; // Standard ELO K-factor
        let expected_score = 50; // Expected engagement percentage
        
        let rating_change = if engagement_score > expected_score {
            ((engagement_score - expected_score) as i32 * k_factor) / 100
        } else {
            -((expected_score - engagement_score) as i32 * k_factor) / 100
        };

        // Update ELO rating (minimum 0)
        if rating_change >= 0 {
            club.elo_rating = club.elo_rating.checked_add(rating_change as u32).unwrap();
        } else {
            club.elo_rating = club.elo_rating.saturating_sub(rating_change.abs() as u32);
        }

        msg!(
            "ELO updated for club: {} | New rating: {} | Change: {}",
            club.name,
            club.elo_rating,
            rating_change
        );
        Ok(())
    }

    /// Join a club (become a member)
    pub fn join_club(ctx: Context<JoinClub>) -> Result<()> {
        let membership = &mut ctx.accounts.membership;
        membership.club = ctx.accounts.club.key();
        membership.user = ctx.accounts.user.key();
        membership.joined_at = Clock::get()?.unix_timestamp;
        membership.is_active = true;
        membership.bump = ctx.bumps.membership;

        // Increment club's total members
        let club = &mut ctx.accounts.club;
        club.total_members = club.total_members.checked_add(1).unwrap();

        msg!(
            "User {} joined club: {}",
            ctx.accounts.user.key(),
            club.name
        );
        Ok(())
    }

    /// Close an event (mark as inactive)
    pub fn close_event(ctx: Context<CloseEvent>) -> Result<()> {
        let event = &mut ctx.accounts.event;
        require!(event.is_active, ErrorCode::EventNotActive);

        event.is_active = false;

        msg!("Event closed: {}", event.name);
        Ok(())
    }
}

// Account Structures

#[account]
pub struct Club {
    pub authority: Pubkey,      // Club admin
    pub name: String,            // Max 64 chars
    pub description: String,     // Max 256 chars
    pub elo_rating: u32,         // ELO rating for leaderboard
    pub total_events: u32,       // Total events created
    pub total_members: u32,      // Total members
    pub created_at: i64,         // Unix timestamp
    pub bump: u8,                // PDA bump
}

#[account]
pub struct Event {
    pub club: Pubkey,            // Associated club
    pub event_id: u64,           // Unique event ID
    pub name: String,            // Max 64 chars
    pub description: String,     // Max 256 chars
    pub location: String,        // Max 128 chars
    pub start_time: i64,         // Unix timestamp
    pub end_time: i64,           // Unix timestamp
    pub max_capacity: u32,       // Maximum attendees
    pub current_attendance: u32, // Current number of attendees
    pub is_active: bool,         // Whether event is active
    pub created_at: i64,         // Unix timestamp
    pub bump: u8,                // PDA bump
}

#[account]
pub struct Attendance {
    pub event: Pubkey,           // Associated event
    pub user: Pubkey,            // User who attended
    pub timestamp: i64,          // Check-in timestamp
    pub photo_hash: String,      // IPFS/Arweave hash of photo proof
    pub verified: bool,          // Whether attendance is verified
    pub bump: u8,                // PDA bump
}

#[account]
pub struct Membership {
    pub club: Pubkey,            // Associated club
    pub user: Pubkey,            // Member user
    pub joined_at: i64,          // Join timestamp
    pub is_active: bool,         // Whether membership is active
    pub bump: u8,                // PDA bump
}

// Context Structures

#[derive(Accounts)]
#[instruction(name: String)]
pub struct RegisterClub<'info> {
    #[account(
        init,
        payer = authority,
        space = 8 + // discriminator
                32 + // authority
                4 + 64 + // name (String with length prefix)
                4 + 256 + // description
                4 + // elo_rating
                4 + // total_events
                4 + // total_members
                8 + // created_at
                1, // bump
        seeds = [b"club", authority.key().as_ref(), name.as_bytes()],
        bump
    )]
    pub club: Account<'info, Club>,
    #[account(mut)]
    pub authority: Signer<'info>,
    pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
#[instruction(event_id: u64)]
pub struct CreateEvent<'info> {
    #[account(
        init,
        payer = authority,
        space = 8 + // discriminator
                32 + // club
                8 + // event_id
                4 + 64 + // name
                4 + 256 + // description
                4 + 128 + // location
                8 + // start_time
                8 + // end_time
                4 + // max_capacity
                4 + // current_attendance
                1 + // is_active
                8 + // created_at
                1, // bump
        seeds = [b"event", club.key().as_ref(), event_id.to_le_bytes().as_ref()],
        bump
    )]
    pub event: Account<'info, Event>,
    #[account(
        mut,
        constraint = club.authority == authority.key() @ ErrorCode::Unauthorized
    )]
    pub club: Account<'info, Club>,
    #[account(mut)]
    pub authority: Signer<'info>,
    pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
pub struct RecordAttendance<'info> {
    #[account(
        init,
        payer = user,
        space = 8 + // discriminator
                32 + // event
                32 + // user
                8 + // timestamp
                4 + 128 + // photo_hash
                1 + // verified
                1, // bump
        seeds = [b"attendance", event.key().as_ref(), user.key().as_ref()],
        bump
    )]
    pub attendance: Account<'info, Attendance>,
    #[account(mut)]
    pub event: Account<'info, Event>,
    #[account(mut)]
    pub user: Signer<'info>,
    pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
pub struct CalculateElo<'info> {
    #[account(
        mut,
        constraint = club.authority == authority.key() @ ErrorCode::Unauthorized
    )]
    pub club: Account<'info, Club>,
    pub authority: Signer<'info>,
}

#[derive(Accounts)]
pub struct JoinClub<'info> {
    #[account(
        init,
        payer = user,
        space = 8 + // discriminator
                32 + // club
                32 + // user
                8 + // joined_at
                1 + // is_active
                1, // bump
        seeds = [b"membership", club.key().as_ref(), user.key().as_ref()],
        bump
    )]
    pub membership: Account<'info, Membership>,
    #[account(mut)]
    pub club: Account<'info, Club>,
    #[account(mut)]
    pub user: Signer<'info>,
    pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
pub struct CloseEvent<'info> {
    #[account(
        mut,
        constraint = event.club == club.key() @ ErrorCode::Unauthorized
    )]
    pub event: Account<'info, Event>,
    #[account(
        constraint = club.authority == authority.key() @ ErrorCode::Unauthorized
    )]
    pub club: Account<'info, Club>,
    pub authority: Signer<'info>,
}

// Error Codes

#[error_code]
pub enum ErrorCode {
    #[msg("Name too long (max 64 characters)")]
    NameTooLong,
    #[msg("Description too long (max 256 characters)")]
    DescriptionTooLong,
    #[msg("Location too long (max 128 characters)")]
    LocationTooLong,
    #[msg("Photo hash too long (max 128 characters)")]
    PhotoHashTooLong,
    #[msg("Invalid timestamp")]
    InvalidTimestamp,
    #[msg("Invalid capacity")]
    InvalidCapacity,
    #[msg("Event not active")]
    EventNotActive,
    #[msg("Event at capacity")]
    EventAtCapacity,
    #[msg("Event not in progress")]
    EventNotInProgress,
    #[msg("Invalid engagement score")]
    InvalidScore,
    #[msg("Unauthorized")]
    Unauthorized,
}
