# Docker

## add autocompletion in [[Zsh]]

1. Download completion script and place in `zsh-completions` directory

```zsh
curl \
  -L https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose
  -o /usr/local/share/zsh/zsh-completions
```

<https://docs.docker.com/compose/completion/>

## dotnet core locally with https

Useful GitHub issues thread: [How to setup the dev certificate when using Docker in development #6199](https://github.com/dotnet/AspNetCore.Docs/issues/6199)

### Errors

#### Permissions error in Linux

Error similar to

```bash
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock:
```

##### Cause

Running as a nonroot user who needs to be added to the `docker` group.

##### Fix

1. Create the docker group: `$ sudo groupadd docker`
2. Add your user to the `docker` group: `$ sudo usermod -aG docker $USER`
3. Log your user out then back in.

_source_: <https://docs.docker.com/engine/install/linux-postinstall/>

#### docker-compose build fails

```text
docker.errors.DockerException: Error while fetching server API version: ('Connection aborted.', FileNotFoundError(2, 'No such file or directory'))
[4658] Failed to execute script docker-compose
```

##### Cause

Docker service isn't running

##### Fix

Start the Docker service

#### docker-compose up fails

##### Can't find installed .NET Core SDKs

```text
It was not possible to find any installed .NET Core SDKs
Did you mean to run .NET Core SDK commands? Install a .NET Core SDK from:
https://aka.ms/dotnet-download
```

###### Cause

Renamed project

###### Fix

Didn't update [EntryPoint] in Dockerfile after project rename

#### Kestrel won't start

##### BIO_new_file

```text
crit: Microsoft.AspNetCore.Server.Kestrel[0]
Unable to start Kestrel.
Interop+Crypto+OpenSslCryptographicException: error:2006D080:BIO routines:BIO_new_file:no such file
  at Interop.Crypto.CheckValidOpenSslHandle(SafeHandle handle)
  at Internal.Cryptography.Pal.OpenSslX509CertificateReader.FromFile(String fileName, SafePasswordHandle password, X509KeyStorageFlags keyStorageFlags)
  at System.Security.Cryptography.X509Certificates.X509Certificate..ctor(String fileName, String password, X509KeyStorageFlags keyStorageFlags)
  at System.Security.Cryptography.X509Certificates.X509Certificate2..ctor(String fileName, String password)
  at Microsoft.AspNetCore.Server.Kestrel.KestrelConfigurationLoader.LoadCertificate(CertificateConfig certInfo, String endpointName)
  at Microsoft.AspNetCore.Server.Kestrel.KestrelConfigurationLoader.LoadDefaultCert(ConfigurationReader configReader)
  at Microsoft.AspNetCore.Server.Kestrel.KestrelConfigurationLoader.Load()
  at Microsoft.AspNetCore.Server.Kestrel.Core.KestrelServer.ValidateOptions()
  at Microsoft.AspNetCore.Server.Kestrel.Core.KestrelServer.StartAsync[TContext](IHttpApplication`1 application, CancellationToken cancellationToken)
```

###### Cause

Can't find \*.pfx file

###### Fix

Make sure cert name and secrets.json value match

#### HTTPS request failure

##### SSL must use cert with associated private key

```text
fail: Microsoft.AspNetCore.Server.Kestrel[0]
Unhandled exception while processing 0HM844URB9B5S.
System.NotSupportedException: The server mode SSL must use a certificate with the associated private key.
  at System.Net.Security.SecureChannel.AcquireServerCredentials(Byte[]& thumbPrint, Byte[] clientHello)
  at System.Net.Security.SecureChannel.GenerateToken(Byte[] input, Int32 offset, Int32 count, Byte[]& output)
  at System.Net.Security.SecureChannel.NextMessage(Byte[] incoming, Int32 offset, Int32 count)
  at System.Net.Security.SslStream.StartSendBlob(Byte[] incoming, Int32 count, AsyncProtocolRequest asyncRequest)
  at System.Net.Security.SslStream.ProcessReceivedBlob(Byte[] buffer, Int32 count, AsyncProtocolRequest asyncRequest)
  at System.Net.Security.SslStream.StartReadFrame(Byte[] buffer, Int32 readBytes, AsyncProtocolRequest asyncRequest)
  at System.Net.Security.SslStream.StartReceiveBlob(Byte[] buffer, AsyncProtocolRequest asyncRequest)
  at System.Net.Security.SslStream.ForceAuthentication(Boolean receiveFirst, Byte[] buffer, AsyncProtocolRequest asyncRequest)
  at System.Net.Security.SslStream.ProcessAuthentication(LazyAsyncResult lazyResult, CancellationToken cancellationToken)
  at System.Net.Security.SslStream.BeginAuthenticateAsServer(SslServerAuthenticationOptions sslServerAuthenticationOptions, CancellationToken cancellationToken, AsyncCallback asyncCallback, Object asyncState)
  at System.Net.Security.SslStream.<>c.<AuthenticateAsServerAsync>b__69_0(SslServerAuthenticationOptions arg1, CancellationToken arg2, AsyncCallback callback, Object state)
  at System.Threading.Tasks.TaskFactory`1.FromAsyncImpl[TArg1,TArg2](Func`5 beginMethod, Func`2 endFunction, Action`1 endAction, TArg1 arg1, TArg2 arg2, Object state, TaskCreationOptions creationOptions)
  at System.Threading.Tasks.TaskFactory.FromAsync[TArg1,TArg2](Func`5 beginMethod, Action`1 endMethod, TArg1 arg1, TArg2 arg2, Object state, TaskCreationOptions creationOptions)
  at System.Threading.Tasks.TaskFactory.FromAsync[TArg1,TArg2](Func`5 beginMethod, Action`1 endMethod, TArg1 arg1, TArg2 arg2, Object state)
  at System.Net.Security.SslStream.AuthenticateAsServerAsync(SslServerAuthenticationOptions sslServerAuthenticationOptions, CancellationToken cancellationToken)
  at Microsoft.AspNetCore.Server.Kestrel.Https.Internal.HttpsConnectionMiddleware.InnerOnConnectionAsync(ConnectionContext context)
  at Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure.KestrelConnection.ExecuteAsync()
```

###### Cause

Certificate does not have a key (based on <https://parsstudent.com/asp-net-core-2-1-application-in-docker-with-https-enabled/>)

###### Fix

Make sure to sign the certificate with a key. If necessary, delete the localhost certs from Keychain.app and then regenerate the certificates.

## run localhost SQL Server

> NOTE: the password for SA is persisted on the volume

```bash
sudo docker run -d -e ACCEPT_EULA=Y -e MSSQL_SA_PASSWORD=blahBlah1234 \
   -p 1433:1433 --name rgb-sql \
   -v rgb-sql-data:/var/opt/mssql \
   -d mcr.microsoft.com/mssql/server:2019-GA-ubuntu-16.04
```

### create login

```sql
CREATE LOGIN $user
    WITH PASSWORD = '$password';
```

### create database user

```sql
USE $db_name;
CREATE USER $user_name FOR LOGIN $user
GO
```

### grant CONTROL in DB to user

```sql
USE $db_name;
GRANT CONTROL ON DATABASE:$db_name TO $user_name;
GO
```
