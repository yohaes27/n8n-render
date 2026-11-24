# Etapa 1: descargar las librerías para generar el Word
FROM node:22-alpine AS builder
WORKDIR /build
RUN npm install --omit=dev docxtemplater@3.71.0 pizzip@3.2.0

# Etapa 2: n8n oficial (versión fija) + las librerías
FROM n8nio/n8n:2.48.7
USER root
COPY --from=builder /build/node_modules /usr/local/lib/node_modules
USER node
ENV NODE_FUNCTION_ALLOW_EXTERNAL=docxtemplater,pizzip
