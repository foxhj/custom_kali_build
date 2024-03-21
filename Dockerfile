FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

COPY --chown=root:root --chmod=755 update.sh /usr/local/bin/update
COPY --chown=root:root --chmod=644 vimrc.txt /root/.vimrc
COPY --chown=root:root --chmod=644 tmux.conf /root/.tmux.conf

RUN update
RUN apt install -y kali-linux-headless \
kali-tools-windows-resources \
kali-tools-crypto-stego \
kali-tools-information-gathering \
ffuf \
gobuster \
feroxbuster \
seclists \
xxd \
iputils-ping \
rlwrap \
ncat \
jq \
pipx \
nishang

RUN pipx install git+https://github.com/Pennyw0rth/NetExec
RUN for i in $(ls /root/.local/bin); do ln -s /root/.local/bin/${i} /usr/local/bin/${i}; done

SHELL ["/bin/zsh", "-c"]

WORKDIR /root

ENV DEBIAN_FRONTEND=

CMD ["zsh"]