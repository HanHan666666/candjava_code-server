FROM codercom/code-server:latest

RUN sudo apt-get update \
    && sudo apt-get install -y \
    gcc \
    gdb \
    g++ \
    python3 \
    openjdk-17-jdk \
    wget

RUN code-server --install-extension redhat.java \
    && code-server --install-extension vscjava.vscode-maven \
    && code-server --install-extension vscjava.vscode-java-dependency \
    && code-server --install-extension vscjava.vscode-java-debug \
    && code-server --install-extension vscjava.vscode-java-test \
    && code-server --install-extension formulahendry.code-runner 

RUN wget https://github.com/microsoft/vscode-cpptools/releases/download/v1.9.7/cpptools-linux.vsix \
    && code-server --install-extension cpptools-linux.vsix && rm cpptools-linux.vsix
