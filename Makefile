# Created by: mrhanky <mrhanky@unterschicht.tv>
# $FreeBSD$

PORTNAME=	pyload
PORTVERSION=	0.4.9
CATEGORIES=	www
MASTER_SITES=	GH
DISTNAME=	${GH_ACCOUNT}-${GH_PROJECT}-${PORTVERSION}-0-g${GH_COMMIT}

MAINTAINER=	mrhanky@unterschicht.tv
COMMENT=	A lightweight one-click download manager written in python

RUN_DEPENDS=	${PYTHON_LIBDIR}/lib-dynload/_sqlite3.so:${PORTSDIR}/databases/py-sqlite3 \
		${PYTHON_SITELIBDIR}/curl:${PORTSDIR}/ftp/py-curl \
		${PYTHON_SITELIBDIR}/django:${PORTSDIR}/www/py-django \
		${PYTHON_SITELIBDIR}/PIL:${PORTSDIR}/graphics/py-imaging \
		${PYTHON_SITELIBDIR}/Crypto:${PORTSDIR}/security/py-pycrypto

USE_GITHUB=	yes
GH_ACCOUNT=	pyload
GH_PROJECT=	pyload
GH_COMMIT=	6632445
GH_TAGNAME=	stable

NO_BUILD=	yes
USE_PYTHON=	yes
USE_RC_SUBR=	pyload
TESSERACT_LANGS=eng

SUB_FILES=pkg-message
WRKSRC=${WRKDIR}/${GH_ACCOUNT}-${GH_PROJECT}-${GH_COMMIT}
BINARY_DIR=${PREFIX}/bin
INSTALL_DIR=${PREFIX}/www/${PORTNAME}

OPTIONS_DEFINE=	JSENGINE OPENSSL TESSERACT UNPACK
OPTIONS_DEFAULT=JSENGINE TESSERACT UNPACK
JSENGINE_DESC=	Install spidermonkey JS engine for Click'n'load
TESSERACT_DESC=	Image recognition provided by gocr and tesseract
UNPACK_DESC=	Install unrar and unzip to unpack downloads

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MJSENGINE}
RUN_DEPENDS+=	spidermonkey17>0:${PORTSDIR}/lang/spidermonkey17
.endif

.if ${PORT_OPTIONS:MOPENSSL}
USE_OPENSSL=	yes
RUN_DEPENDS+=	${PYTHON_SITELIBDIR}/OpenSSL:${PORTSDIR}/security/py-openssl
.endif

.if ${PORT_OPTIONS:MTESSERACT}
RUN_DEPENDS+=	gocr>0:${PORTSDIR}/graphics/gocr \
		tesseract>0:${PORTSDIR}/graphics/tesseract \
		tesseract-data>0:${PORTSDIR}/graphics/tesseract-data
.endif

.if ${PORT_OPTIONS:MUNPACK}
RUN_DEPENDS+=	unrar>0:${PORTSDIR}/archivers/unrar \
		unzip>0:${PORTSDIR}/archivers/unzip
.endif

do-install:
	${MKDIR} ${INSTALL_DIR}
	(cd ${WRKSRC} && ${COPYTREE_SHARE} \* ${INSTALL_DIR})
	${LN} -fs ${INSTALL_DIR}/pyLoadCore.py ${BINARY_DIR}/pyload
	${LN} -fs ${INSTALL_DIR}/pyLoadCli.py ${BINARY_DIR}/pyload-cli
	${LN} -fs ${INSTALL_DIR}/pyLoadGui.py ${BINARY_DIR}/pyload-gui
	(cd ${BINARY_DIR} && ${CHMOD} +x pyload pyload-cli pyload-gui)

post-install:
	@${CAT} ${WRKDIR}/pkg-message

.include <bsd.port.mk>
