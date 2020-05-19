# $FreeBSD$

PORTNAME=	zstd
DISTVERSION=	1.4.4-11
CATEGORIES=	archivers java
PKGNAMESUFFIX=	jni
DISTNAME=	${PORTNAME}-${PKGNAMESUFFIX}-${DISTVERSION}
DISTFILES+=	${PORTNAME}-${PKGNAMESUFFIX}-${DISTVERSION}-repo.tar.gz:repo

MAINTAINER=	language.devel@gmail.com
COMMENT=	JNI bindings for the Zstd lossless compression library

LICENSE=	BSD2CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

ONLY_FOR_ARCHS=	amd64

BUILD_DEPENDS=	cmake:devel/cmake \
		sbt:devel/sbt

USE_GITHUB=	yes
GH_ACCOUNT=	luben
GH_PROJECT=	${PORTNAME}-${PKGNAMESUFFIX}
GH_TAGNAME=	v${DISTVERSION}

REINPLACE_ARGS=	-i ''

TEST_TARGET=	test

post-extract:
	@${RM} ${WRKSRC}/sbt

post-patch:
	@${REINPLACE_CMD} -e 's|jniNativeCompiler := "gcc"|jniNativeCompiler := "${CC}"|' ${WRKSRC}/build.sbt

do-build:
	@cd ${WRKSRC} && sbt -Dsbt.ivy.home=${WRKDIR}/.ivy2 -Dsbt.boot.directory=${WRKDIR}/sbt-boot -Dsbt.global.base=${WRKDIR}/sbt-global -Dsbt.offline=true -Dsbt.coursier=false compile package

do-install:
	${INSTALL_DATA} ${WRKSRC}/target/${PORTNAME}-${PKGNAMESUFFIX}-${DISTVERSION}.jar ${STAGEDIR}${JAVAJARDIR}/${PORTNAME}-${PKGNAMESUFFIX}.jar

do-test:
	@cd ${WRKSRC} && sbt -Dsbt.ivy.home=${WRKDIR}/.ivy2 -Dsbt.boot.directory=${WRKDIR}/sbt-boot -Dsbt.global.base=${WRKDIR}/sbt-global -Dsbt.offline=true -Dsbt.coursier=false test

.include <bsd.port.mk>
