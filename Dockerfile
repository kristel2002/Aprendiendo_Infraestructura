# Para entender dockerfile revise esta pagina: 
# https://medium.com/@wawerumwaura/nginx-and-docker-configuration-aac7b26210fe#id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6ImYxMGY4NzQwNWE5NzljMWRmMzZkZjI2NjA2NzM0ZjMzY2Q4NWMyNzEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiIyMTYyOTYwMzU4MzQtazFrNnFlMDYwczJ0cDJhMmphbTRsamRjbXMwMHN0dGcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIyMTYyOTYwMzU4MzQtazFrNnFlMDYwczJ0cDJhMmphbTRsamRjbXMwMHN0dGcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDM2NTk0Njc5NzA4MjMxMjQzNDUiLCJlbWFpbCI6ImtyaXNjYXRoZXJpdmVyYTIwMDJAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5vbmNlIjoibm90X3Byb3ZpZGVkIiwibmJmIjoxNzg3MTgzMjg4LCJuYW1lIjoia3Jpc3RlbCBSaXZlcmEiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jTGFJaS11aUhHWHRoNG1PeUI1NnBpLUhZeWVFRHpud2hiU2JpUUJ2Szh4Z0NVOGZRPXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6ImtyaXN0ZWwiLCJmYW1pbHlfbmFtZSI6IlJpdmVyYSIsImlhdCI6MTc4NzE4MzU4OCwiZXhwIjoxNzg3MTg3MTg4LCJqdGkiOiIxZGFhZDcxMGI4ZjJhYjVkNDE1MjQxMWI1NGFkYjcxZGM3YWU5YTFlIn0.0BwZDoY9fejHmfsSM_58KLvk7p8wVdAg6w8R7j-Xgz8_S1MayyJJv5Mip6ACiz_OL8FjsHu4JmkxzE-gahYpyo6kiwH5j_HRU3Dx4_k4uRFj_V8haENbvEtDNWPs1W8ksheTEPnq912VVETVKK7WR5JTz8wmu6g06vVHp9CZKT5A8j_8iKlAOR1udqJ1rG3a6pJSRa-cJRp-758-AWhzr2Err9fhs3ifJCRsXy0wKs7KwVKWiikeO_q_IFtpfLSiM_cDS4UHjdQqr11WlkFn_kh96GE7lLtYadYh7YSVN7qAR7_sPGQY3_pG6caKpGoaTQW-bWjl0aOdl27pCsGbUw
# Un Dockerfile es básicamente el archivo que crea el contenedor que encapsulará tu aplicación y la hará ejecutable en cualquier entorno Unix.

# ============================================
# ETAPA 1: Entorno de construcción
# ============================================

FROM node:18-alpine AS build-deps

WORKDIR /usr/src/app

ENV PATH=/usr/src/app/node_modules/.bin:$PATH

COPY package.json package-lock.json ./

RUN npm install --silent

COPY . /usr/src/app

RUN npm run build

# ============================================
# ETAPA 2: Entorno de producción con Nginx + Perl
# ============================================

FROM nginx:trixie-perl

# Instalamos utilidades adicionales (opcional)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Creamos usuario no-root para seguridad
RUN useradd -u 1001 -m -s /bin/bash nginx-user && \
    chown -R nginx-user:nginx-user /usr/share/nginx/html

# Copiamos los archivos construidos
COPY --from=build-deps /usr/src/app/build /usr/share/nginx/html

# Cambiamos al usuario no-root
USER nginx-user

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]