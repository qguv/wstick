BINARY=win
BUILD_DIR=obj
META_DIR=meta

.PHONY: ${BUILD_DIR}/${BINARY}
${BUILD_DIR}/${BINARY}: ${BUILD_DIR}/Makefile
	${MAKE} -C ${BUILD_DIR}

${BUILD_DIR}/Makefile: ${BINARY}.pro
	qmake -o ${BUILD_DIR}/Makefile $<

.PHONY: clean
clean:
	rm -rf ${BUILD_DIR}
