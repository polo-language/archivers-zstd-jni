# $FreeBSD$

PORTNAME=	zstd
DISTVERSION=	1.4.4-9
CATEGORIES=	archivers java
PKGNAMESUFFIX=	jni
DISTNAME=	${PORTNAME}-${PKGNAMESUFFIX}-${DISTVERSION}
DISTFILES+=	${PORTNAME}-${PKGNAMESUFFIX}-${DISTVERSION}-repo.tar.gz:repo

MAINTAINER=	language.devel@gmail.com
COMMENT=	JNI bindings for the Zstd lossless compression library

LICENSE=	BSD2CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

ONLY_FOR_ARCHS=	amd64

BUILD_DEPENDS=	sbt:devel/sbt

USE_GITHUB=	yes
GH_ACCOUNT=	luben
GH_PROJECT=	${PORTNAME}-${PKGNAMESUFFIX}
GH_TAGNAME=	v${DISTVERSION}

USE_GCC=	yes

REINPLACE_ARGS=	-i ''

TEST_TARGET=	test

post-patch:
	@${REINPLACE_CMD} -e 's|jniNativeCompiler := "gcc"|jniNativeCompiler := "${CC}"|' ${WRKSRC}/build.sbt

do-build:
	@cd ${WRKSRC} && sbt -Dsbt.ivy.home=${WRKDIR}/.ivy2 compile package

do-install:
	${INSTALL_DATA} ${WRKSRC}/target/${PORTNAME}-${PORTVERSION}.jar ${STAGEDIR}${JAVAJARDIR}/${PORTNAME}.jar

.include <bsd.port.mk>
