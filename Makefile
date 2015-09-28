# Created by: mrhanky <mrhanky@unterschicht.tv>
# $FreeBSD$

PORTNAME=	pyload
PORTVERSION=	0.4.9
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	GH
DISTNAME=	${GH_ACCOUNT}-${GH_PROJECT}-${PORTVERSION}-${GH_TAGNAME}-g${GH_COMMIT}

MAINTAINER=	mrhanky@unterschicht.tv
COMMENT=	A lightweight one-click download manager written in python

LICENSE=	GPLv3

RUN_DEPENDS=	${PYTHON_LIBDIR}/lib-dynload/_sqlite3.so:${PORTSDIR}/databases/py-sqlite3 \
		${PYTHON_SITELIBDIR}/curl:${PORTSDIR}/ftp/py-curl \
		${PYTHON_SITELIBDIR}/django:${PORTSDIR}/www/py-django \
		${PYTHON_SITELIBDIR}/PIL:${PORTSDIR}/graphics/py-imaging \
		${PYTHON_SITELIBDIR}/Crypto:${PORTSDIR}/security/py-pycrypto \
		${PYTHON_SITELIBDIR}/django:${PORTSDIR}/www/py-django

USE_GITHUB=	yes
GH_ACCOUNT=	pyload
GH_PROJECT=	pyload
GH_TAGNAME=	58de8f805b4a7303674d5d3c9aa9b58dcef30f03

NO_BUILD=	yes
USES=gettext
USES=python
USE_SQLITE3=	yes

USE_RC_SUBR=	pyload
SUB_FILES=	pkg-message
BINARY_DIR=	${PREFIX}/bin
INSTALL_DIR=	${PREFIX}/share/${PORTNAME}

OPTIONS_DEFINE=	JSENGINE OPENSSL TESSERACT UNPACK
OPTIONS_DEFAULT=JSENGINE TESSERACT UNPACK
JSENGINE_DESC=	Install spidermonkey JS engine for Click'n'load
TESSERACT_DESC=	Image recognition provided by gocr and tesseract
UNPACK_DESC=	Install binaries for extracting .rar and .zip files

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MJSENGINE}
RUN_DEPENDS+=	spidermonkey17>0:${PORTSDIR}/lang/spidermonkey17
.endif

.if ${PORT_OPTIONS:MOPENSSL}
USE_OPENSSL=	yes
RUN_DEPENDS+=	${PYTHON_SITELIBDIR}/OpenSSL:${PORTSDIR}/security/py-openssl
.endif

.if ${PORT_OPTIONS:MTESSERACT}
TESSERACT_LANGS=eng
RUN_DEPENDS+=	gocr>0:${PORTSDIR}/graphics/gocr \
		tesseract>0:${PORTSDIR}/graphics/tesseract \
		tesseract-data>0:${PORTSDIR}/graphics/tesseract-data
.endif

.if ${PORT_OPTIONS:MUNPACK}
RUN_DEPENDS+=	unrar>0:${PORTSDIR}/archivers/unrar \
		unzip>0:${PORTSDIR}/archivers/unzip
.endif

do-install:
	${MKDIR} ${STAGEDIR}${INSTALL_DIR}
	(cd ${WRKSRC} && ${COPYTREE_SHARE} \* ${STAGEDIR}${INSTALL_DIR})
	${LN} -fs ${PREFIX}/share/pyload/pyLoadCore.py ${STAGEDIR}${BINARY_DIR}/pyload
	${LN} -fs ${PREFIX}/share/pyload/pyLoadCli.py ${STAGEDIR}${BINARY_DIR}/pyload-cli
	${LN} -fs ${PREFIX}/share/pyload/pyLoadGui.py ${STAGEDIR}${BINARY_DIR}/pyload-gui

post-install:
	(cd ${STAGEDIR}${PREFIX} \
	            && ${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
	                        -d ${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;})
.include <bsd.port.mk>
