# Jekyll TwoXify

Generate the @2x `img` tag `src` and `srcset` (see <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-srcset>) attributes for a given image path, only including a 2x `srcset` if it exists on the filesystem.

## Doesn't this seem like overkill for a simple thing?

Listen, I got really tired of pasting this absolute nonsense into my templates all over the place:

````
  {% assign retinaImage = postImage | split: "" | reverse | join: "" | replace_first: '.', '.x2@' | split: "" | reverse | join: "" %}
````

ugggh

## Installation

(https://jekyllrb.com/docs/plugins/installation/)

One of two options:

### Bundler Config
:warning: **If using bundler with a vendor prefix, this is the required method**

1. In your `Gemfile`, add the `jekyll_plugins` group if it doesn't already exist, and add `jekyll-twoxify` to it. For example: 

  ```ruby
  group :jekyll_plugins do
    gem "jekyll-twoxify"
  end
  ```

2. Tell bundler to install any plugins with

  ```
  $ bundle install
  ```


### Jekyll Config

1. In your `_config.yml`, add the `plugins` key if it doesn't already exist, and add a value of `jekyll-twoxify`. For example:

	```yaml
	plugins: 
	  - jekyll-twoxify
	```

2. Install this gem

  ```
  $ gem install jekyll-twoxify
  ```

## Usage

### Tag

Add the `twoxify` template tag to any `img` tag in place of both the `src` and `srcset` attributes, with the desired image path. The tag will output the `src` value and, if it exists in the filesystem, the `srcset` attribute with the @2x path. It will automagically prepend the `site.url` to both paths.

Pass in image as a string:

```
<img {% twoxify "assets/img/mycoolphoto.jpg" %} />
```

If `mycoolphoto@2x.jpg` exists, results in:

```
<img 
  src="https://mycoolwebsite.com/assets/img/mycoolphoto.jpg" 
  srcset="https://mycoolwebsite.com/assets/img/mycoolphoto@2x.jpg 2x" />
```

Else:

```
<img src="https://mycoolwebsite.com/assets/img/mycoolphoto.jpg" />
```

Variables or frontmatter are also supported:

```
<img {% twoxify post.image %} />

{% assign copied_image = "/assets/wow/numbertwo.png" %}
<img {% twoxify copied_image %} />
```