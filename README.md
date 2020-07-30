<p align="center">
	<h3 align="center">Kali my Linux</h3>
</p>

<p align="center">
	<a target="__blank" href="#">
	  <img src="https://img.shields.io/badge/status-in progress-red?&style=for-the-badge"/>
	  <img src="https://img.shields.io/badge/license-apache-blue?&style=for-the-badge"/>
	</a>
	<p align="center">Automatically Install Pentest Tools</p>
</p>

___

<br>

<h4>Alert:</h4>

<p>Before to <b>install tools</b>, first <b>install repository</b>.</p>
<p>In most cases you need to indicate your <b>distribution</b>.</p>


<br>

<h4>You can run on:</h4>
 <ul>
  <li>Debian</li>
  <li>Ubuntu</li>
  <li>Zorin</li>
  <li>Linux Mint</li>
  <li>Arch Linux</li>
  <li>Manjaro</li>
</ul> 

<br>

<h4>Install & Run</h4>

Copy and paste to terminal.

```sh
git clone https://github.com/i686leak/kali-my-linux && cd kali-my-linux && chmod +x kml.rb
```

```sh
ruby kml.rb -h
```

<br>

<h4>Using</h4>

```sh
ruby kml.rb -h
```

<img src="https://user-images.githubusercontent.com/41551840/88863880-493c8480-d1da-11ea-8d66-9a65f9eea8f4.png">

<br>

<h4>Examples</h4>

Install repository to Debian.

```sh
ruby kml.rb -d Debian -i
```

Remove repository from Debian.

```sh
ruby kml.rb -d Debian -u
```

Install all tools to Mint.

```sh
ruby kml.rb -d Mint -t all
```

Install web tools to Manjaro.

```sh
ruby kml.rb -d Manjaro -t web
```

<hr>

