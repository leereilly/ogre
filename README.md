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

### LICENSE

MIT

### Bugs / Known Issues / Limitations

* This is a proof-of-concept. 
* It won't scale. 
* Do not use this in production.
* It is 100% ~~bug~~ free.

![Bugs](http://i.imgur.com/K8vsw.gif "Bugs")
