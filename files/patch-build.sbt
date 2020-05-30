--- build.sbt.orig	2020-05-30 09:14:45 UTC
+++ build.sbt
@@ -87,7 +87,7 @@ jniJreIncludes := {
       }
       // in a typical installation, JDK files are one directory above the
       // location of the JRE set in 'java.home'
-      Seq(s"include", s"include/$jniPlatformFolder").map(file => s"-I$absHome/../$file")
+      Seq(s"include", s"include/$jniPlatformFolder").map(file => s"-I$absHome/$file")
     }
   }
 }
