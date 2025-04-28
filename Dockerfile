# Stage 1: Build
FROM node:22.15.0-alpine3.21  AS builder

WORKDIR /app

RUN npm install -g pnpm

COPY package.json pnpm-lock.yaml ./

RUN pnpm install

COPY . .
ENV PATH="./node_modules/.bin:$PATH"

RUN pnpm build

# Stage 2: Run
FROM node:22.15.0-alpine3.21  AS runner

WORKDIR /app

RUN npm install -g pnpm

# Copy only package files and install production deps
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --prod --frozen-lockfile

# Copy the built output
COPY --from=builder /app/build ./build

EXPOSE 3000

CMD ["node", "build"]
