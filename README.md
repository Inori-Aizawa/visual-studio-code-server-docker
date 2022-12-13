# code-server-docker
 
[visual studio code server](https://code.visualstudio.com/docs/remote/vscode-server)
 packaged in a docker container


## running the container

1. first copy .env.example to .env 
2. edit the values to your liking
3. run ```$ docker build -t inori_aizawa/visual-studio-code-server . ```
4. run ```docker compose up```
### when running locally
remember that anyone can access it if you do not set a token or secure it in any other way
### when running via the tunnel
you need to link your github account with the code displayed in the terminal