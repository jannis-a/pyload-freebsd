--- module/utils.py	2013-07-16 18:22:59.000000000 +0200
+++ module/utils.py	2013-07-16 18:25:04.000000000 +0200
@@ -88,7 +88,7 @@
     """formats size of bytes"""
     size = int(size)
     steps = 0
-    sizes = ["B", "KiB", "MiB", "GiB", "TiB"]
+    sizes = ("B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB")
     while size > 1000:
         size /= 1024.0
         steps += 1
