**Ogre** (Open Graph Ruby Encoder) is a proof of concept app for generating custom `og:image` metadata images dynamically on a *per user basis* e.g.

![](background.png)

### Installation

This is a [Sinatra](http://www.sinatrarb.com/) application, so you'll need to know a bit of Ruby-Fu to get it working. There are a couple of dependencies:

* ImageMagick® and GraphicsMagick image processing libraries **must** be installed, and
* You **must** have a [url2png](http://url2png.com/) account (please set the `api_key` and `private_key` environment variables).

```bash
git clone https://github.com/leereilly/ogre.git
cd ogre
bundle install
ruby ogre.rb
```

![Open Graph Ruby Enforcer](http://i.imgur.com/uvmMmUe.png)

### Usage

Hitting [http://localhost:4567/leereilly](http://localhost:4567/leereilly) will generate the image to be used for the `og:image` metadata: 

```html
<meta property="og:image" content="http://localhost:4567/leereilly" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="620" />
```
### LICENSE

MIT

### Bugs / Known Issues / Limitations

* This is a proof-of-concept. 
* It won't scale. 
* Do not use this in production.
* It is 100% ~~bug~~ free.

![Bugs](http://i.imgur.com/K8vsw.gif "Bugs")
