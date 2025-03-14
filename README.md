# DragonRuby RBS types

This project aims to provide great development experience in RubyMine
for [DragonRuby Game Toolkit](https://dragonruby.org/).

* RBS type definitions for DragonRuby
* Ruby shims, with documentation
* Helpers to avoid some of the shortcoming of RBS support in RubyMine around hashes

If this works in other editors/IDE, this is purely coincidental, but very nice!

**Important:** consider this project experimental (and containing bugs) until it will be battle tested in real life.

<table>
<tr>
<td><img src="docs/autocomplete.png"  alt="autocomplete"></td>
<td><img src="docs/params_hint.png"  alt="params hint"></td>
</tr>
<tr>
<td><img src="docs/documentation.png"  alt="type checking"></td>
<td><img src="docs/type_checking.png"  alt="type checking"></td>
</tr>
</table>

## Usage

Add types as a Git submodule to your project files:

```shell
git submodule add https://github.com/FylmTM/dr-types.git mygame/app/.dr-types
```

**Important:** Make sure to mark `docs` and `samples` from DragonRuby as excluded sources in RubyMine.
Otherwise, source that is shipped with DragonRuby itself will conflict with Ruby shims in this project.

RubyMine should automatically pick up types from now on.

_Note:_ While type directory can be located anywhere, in order to require helpers.rb it must be in `app` directory.

**Update:**

```shell
git submodule update --remote mygame/app/.dr-types
```

### Main

Add `@param args [GTK::Args]` YARD annotation to your top-level lifecycle functions.

```ruby
# @param args [GTK::Args]
def tick(args) end

# @param args [GTK::Args]
def boot(args) end

# @param args [GTK::Args]
def reset(args) end

# @param args [GTK::Args]
def shutdown(args) end
```

### State

WIP.

### Helpers

Want IDE assist when creating objects for `args.outputs.*`? You can use helpers.

```ruby
require_relative ".dr-types/helpers"

args.outputs.solids << GTK.solid(x: 100, y: 100, w: 100, h: 100, r: 255, g: 0, b: 0)
args.outputs.labels << GTK.label(x: 50, y: 50, text: "Hello, world!")
args.outputs.borders << GTK.border(x: 150, y: 150, w: 20, h: 20, r: 0, g: 255, b: 0)
args.outputs.lines << GTK.line(x: 150, y: 150, x2: 300, y2: 300, r: 0, g: 0, b: 255)
args.outputs.sprites << GTK.sprite(x: 250, y: 250, w: 100, h: 100, path: "dragonruby.png")
args.outputs.sprites << GTK.sprite_triangle(x: 20, y: 20, x2: 60, y2: 20, x3: 40, y3: 60, path: "dragonruby.png")
args.outputs.debug << GTK.solid_primitive(x: 400, y: 400, w: 100, h: 100, r: 255, g: 0, b: 0)
args.outputs.debug << GTK.border_primitive(x: 600, y: 600, w: 100, h: 100, r: 255, g: 0, b: 0)

if args.inputs.mouse.click
  args.audio[:note] = GTK.sound(input: "sounds/A3.wav", x: 1, y: 1, z: 1)
end
```

## Background

Creation process looked roughly like this:

1. Initial stubs were generated with `rbs prototype` from `docs/oss`
2. Then they were heavily processed by LLM (Claude 3.7), to do a first pass (cross-referencing docs & code)
3. Then they were heavily manually tweaked by me, to make types sensible
4. Then I went through documentation fully, making sure that nothing is missing
5. Then LLM was used to generate Ruby shims from RBS types
6. Then LLM was used to add YARD documentation to generated Ruby shims
7. And one final review of generated Ruby code & documentation.
8. Write helpers to help with workflow

Types here might have functionality that is not documented explicitly, but was rather deduced based on
OSS code & samples.

Thanks to [owenbutler/dragonruby-yard-doc](https://github.com/owenbutler/dragonruby-yard-doc) for giving me hope.

## TODO

- [ ] Improve: State & Entities
- [ ] Improve: Outputs::[] (render targets)
- [ ] Improve: Outputs::screenshots
- [ ] Improve: Outputs::shaders
- [ ] Support: Layout::rect_group
- [ ] Support: Layout::point
- [ ] Support: macro - attr_sprite
- [ ] Support: macro - attr_gtk
