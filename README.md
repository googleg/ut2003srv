# ut2003srv
Docker image of Unreal Tournament 2003 dedicated server.

Dockerfile to create an image for the Unreal Tournament 2003 dedicated server. 

Get the server package from https://www.moddb.com/games/unreal-tournament-2003/downloads/free-full-version-for-a-dedicated-server-linux and pass it at build time with "--build-arg serverpkg=ut2003-lnxded-2225.tar.tar".

Also make sure to install the Epic Bonus Pack One and then the patch 2225 on the clients to avoid long download of files upon joining the server for the first time.
