FROM golang:alpine

# 为我们的镜像设置必要的环境变量
ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# 移动到工作目录：/build
WORKDIR /build

# 将代码复制到容器中    COPY 是將容器外copy到容器內   (容器外操作)
COPY . .

# 将我们的代码编译成二进制可执行文件app  (容器內操作)
RUN go build -o app .

# 移动到用于存放生成的二进制文件的 /dist 目录
WORKDIR /dist

# 将二进制文件从 /build 目录复制到这里   (容器內操作)
# 在容器內我就執行(linux的指令 容器內的linux指令)run cp來copy
RUN cp /build/app .

# 声明服务端口
EXPOSE 8087

# 启动容器时运行的命令
CMD ["/dist/app"]