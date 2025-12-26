# Flutter and common plugin keep rules
# These help avoid stripping required classes while still allowing minification.

# Flutter embedding and plugin interfaces
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**

# Keep annotations
-keepattributes *Annotation*

# Keep enums used via reflection
-keepclassmembers class ** {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Image Picker (and similar) - be conservative
-keep class io.flutter.plugins.imagepicker.** { *; }
-dontwarn io.flutter.plugins.imagepicker.**

# Gson / serialization safety (if present)
-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**

# OkHttp/Okio (if present)
-dontwarn okhttp3.**
-dontwarn okio.**
