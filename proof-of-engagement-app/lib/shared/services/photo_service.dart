import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

/// Service for handling photo uploads with compression
class PhotoService {
  final ImagePicker _picker = ImagePicker();

  /// Pick an image from camera
  Future<File?> pickImageFromCamera() async {
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (photo == null) return null;

      // Compress the image
      final compressedFile = await _compressImage(File(photo.path));
      return compressedFile;
    } catch (e) {
      debugPrint('Error picking image from camera: $e');
      return null;
    }
  }

  /// Pick an image from gallery
  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (photo == null) return null;

      // Compress the image
      final compressedFile = await _compressImage(File(photo.path));
      return compressedFile;
    } catch (e) {
      debugPrint('Error picking image from gallery: $e');
      return null;
    }
  }

  /// Pick multiple images from gallery
  Future<List<File>> pickMultipleImages({int maxImages = 5}) async {
    try {
      final List<XFile> photos = await _picker.pickMultiImage(
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (photos.isEmpty) return [];

      // Limit to maxImages
      final limitedPhotos = photos.take(maxImages).toList();

      // Compress all images
      final List<File> compressedFiles = [];
      for (final photo in limitedPhotos) {
        final compressedFile = await _compressImage(File(photo.path));
        if (compressedFile != null) {
          compressedFiles.add(compressedFile);
        }
      }

      return compressedFiles;
    } catch (e) {
      debugPrint('Error picking multiple images: $e');
      return [];
    }
  }

  /// Compress image to reduce file size
  Future<File?> _compressImage(File file) async {
    try {
      final dir = await getTemporaryDirectory();
      final targetPath = path.join(
        dir.path,
        '${DateTime.now().millisecondsSinceEpoch}_compressed.jpg',
      );

      final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: 85,
        minWidth: 1920,
        minHeight: 1080,
        format: CompressFormat.jpeg,
      );

      if (result == null) {
        debugPrint('Image compression failed');
        return file; // Return original if compression fails
      }

      return File(result.path);
    } catch (e) {
      debugPrint('Error compressing image: $e');
      return file; // Return original if compression fails
    }
  }

  /// Upload image to IPFS (placeholder - requires actual IPFS integration)
  /// Returns the IPFS hash/CID
  Future<String?> uploadToIPFS(File imageFile) async {
    try {
      // TODO: Integrate with actual IPFS service (e.g., Pinata, NFT.Storage, Web3.Storage)
      // Example using Pinata API:
      // 1. Read file bytes
      // final bytes = await imageFile.readAsBytes();
      // 2. Create multipart request to Pinata
      // 3. Upload and get IPFS hash
      // 4. Return hash
      
      debugPrint('IPFS upload not yet implemented');
      
      // Simulated hash for development
      await Future.delayed(const Duration(seconds: 2));
      final simulatedHash = 'Qm${DateTime.now().millisecondsSinceEpoch}MockIPFSHash';
      
      return simulatedHash;
    } catch (e) {
      debugPrint('Error uploading to IPFS: $e');
      return null;
    }
  }

  /// Upload image to Arweave (placeholder - requires actual Arweave integration)
  /// Returns the Arweave transaction ID
  Future<String?> uploadToArweave(File imageFile) async {
    try {
      // TODO: Integrate with actual Arweave service
      // Example:
      // 1. Read file bytes
      // 2. Create Arweave transaction
      // 3. Sign with wallet
      // 4. Upload and get transaction ID
      // 5. Return transaction ID
      
      debugPrint('Arweave upload not yet implemented');
      
      // Simulated transaction ID for development
      await Future.delayed(const Duration(seconds: 2));
      final simulatedTxId = '${DateTime.now().millisecondsSinceEpoch}MockArweaveTxId';
      
      return simulatedTxId;
    } catch (e) {
      debugPrint('Error uploading to Arweave: $e');
      return null;
    }
  }

  /// Show photo source selection dialog
  Future<File?> pickImageWithDialog({
    required bool showCamera,
    required bool showGallery,
  }) async {
    // This would typically show a dialog in the UI layer
    // For now, default to gallery
    if (showGallery) {
      return await pickImageFromGallery();
    } else if (showCamera) {
      return await pickImageFromCamera();
    }
    return null;
  }

  /// Get image file size in MB
  double getFileSizeInMB(File file) {
    final bytes = file.lengthSync();
    return bytes / (1024 * 1024);
  }

  /// Validate image file
  bool isValidImage(File file, {double maxSizeMB = 10}) {
    final size = getFileSizeInMB(file);
    return size <= maxSizeMB;
  }
}
