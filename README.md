# Momentum Modules - Threshold

A [Factorio](https://factorio.com) mod that adds threshold momentum modules, which switch effects
once a machine reaches full momentum.

A threshold module behaves as one module while momentum is building, then flips to a different one
at 10 momentum — for example a productivity module that becomes a speed module once the machine is
up to speed. The mod generates a module for every ordered pair of entries in the same module family,
so both directions of a pair exist (Prod→Speed and Speed→Prod), across tiers 1-3. Their icons are
split: the left half shows what the module starts as, the right half what it turns into.

Pairs that would mix families (e.g. a clean module with a vanilla one) are skipped, which keeps the
number of combinations manageable.

## Startup settings

| Setting | Default | Description |
| --- | --- | --- |
| Threshold Modules Scaling | 1.0 | How strong the threshold modules are compared to vanilla modules. |
| Threshold mod recipe ingredients | 2 electronic circuits, 1 advanced circuit | Extra ingredients added to every threshold module recipe, on top of the two base modules it is made from. |

Each recipe takes one of each base module plus the extras above, and produces two modules.

## Dependencies

- Factorio 2.0+
- [Momentum Modules](https://github.com/SirRolin/Factorio-momentum-modules) 0.2.0+ — the library mod
  that provides the momentum tracking, module generation and icon tinting used here.
- Optional: Space Age, Quality

## Related mods

- [Momentum Modules](https://github.com/SirRolin/Factorio-momentum-modules) (library)
- [Momentum Modules - Turbo](https://github.com/SirRolin/Factorio-momentum-turbo)
- [Momentum Modules - Catalytic](https://github.com/SirRolin/Factorio-momentum-catalytic)
- [Clean Modules](https://github.com/SirRolin/Factorio-clean-modules)

## Installation

Clone or copy this folder into your Factorio `mods` directory as
`sir-rolins-momentum-threshold_<version>`, or install it from the in-game mod portal.
