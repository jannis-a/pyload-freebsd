--- module/web/cnl_app.py.orig	2015-06-23 21:43:12 UTC
+++ module/web/cnl_app.py
@@ -17,8 +17,8 @@ except:
 
 def local_check(function):
     def _view(*args, **kwargs):
-        if request.environ.get('REMOTE_ADDR', "0") in ('127.0.0.1', 'localhost') \
-        or request.environ.get('HTTP_HOST','0') == '127.0.0.1:9666':
+	if request.environ.get('REMOTE_ADDR', "0") in ('127.0.0.1', 'localhost') \
+    	    or request.environ.get('HTTP_HOST','0') in ('127.0.0.1:9666', 'localhost:9666'):
             return function(*args, **kwargs)
         else:
             return HTTPError(403, "Forbidden")
