FreeBSD port of zstd-jni
=======

This port was created for my own testing purposes. It has not been submitted to
the ports tree since the author of zstd-jni kindly publishes artifacts for
FreeBSD amd64 and, at my instigation, i386.

pkg-descr
-----------

Zstd-jni provides Java Native Interface bindings for the Zstd native library.
Zstandard, or zstd for short, is a fast, lossless compression algorithm,
targeting real-time compression scenarios at zlib-level and better compression
ratios.

This port does not depend on archivers/zstd, instead it builds and embeds its
own copy of the native library. The embedded native library version is the
value of this port's DISTVERSION to the left of the hyphen.

WWW: https://github.com/luben/zstd-jni
