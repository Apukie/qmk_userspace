# Porting a Keyboard for Halcyon Module Support

Ensure the setup in the main README is completed before proceeding.

This guide applies to:

* Keyboards with a **Halcyon + VIK connector**
* Keyboards using the **Halcyon → Pro Micro adapter**

## 1. Enable Halcyon Modules in Your Keymap

Copy or create your keymap in this repository.

In your keymap directory, update or create `rules.mk`:

```make
USER_NAME := halcyon_modules
```

If using the Halcyon → Pro Micro adapter, also add:

```make
CONVERT_TO = halcyon
```

## 2. Configure Encoder Support

Edit:

```
users/halcyon_modules/splitkb/config.h
```

Add a keyboard-specific override. Pin values must match those defined in `keyboard.json`.

Replace `/` with `_` in the keyboard identifier:

```c
#ifdef KEYBOARD_splitkb_halcyon_elora_rev2_hlc
    #define ENCODER_A_PINS { GP22, HLC_ENCODER_A }
    #define ENCODER_B_PINS { GP18, HLC_ENCODER_B }
#endif
```

If the keyboard defines a split encoder, also override right-half pins:

```c
#ifdef KEYBOARD_splitkb_aurora_corne_rev1_hlc
    #undef ENCODER_A_PINS
    #undef ENCODER_B_PINS
    #define ENCODER_A_PINS { D4, HLC_ENCODER_A }
    #define ENCODER_B_PINS { C6, HLC_ENCODER_B }

    #undef ENCODER_A_PINS_RIGHT
    #undef ENCODER_B_PINS_RIGHT
    #define ENCODER_A_PINS_RIGHT { F6, HLC_ENCODER_A }
    #define ENCODER_B_PINS_RIGHT { F7, HLC_ENCODER_B }
#endif
```

## 3. Expand the Matrix

In your keymap's `config.h`, override the column count when Halcyon is enabled. Create the file if needed.

Determine the current column count from `keyboard.json`, then add 5:

```c
#ifdef HALCYON_ENABLE
    #undef MATRIX_COLS
    #define MATRIX_COLS 11  // original + 5
#endif
```

## 4. Define Halcyon Button Mappings

Update `keymap.c`, or create a new file if you're using the `keymap.json` (e.g. `halcyon_keys.c`).

If creating a new file:

* Add `#include QMK_KEYBOARD_H`
* Register it in `rules.mk`:

  ```make
  SRC += halcyon_keys.c
  ```

Add:

```c
#if defined(HALCYON_ENABLE)

const uint16_t left_halcyon_buttons[10][5] = {
    [0] = { KC_MUTE, _______, _______, _______, _______ },
    [1] = { _______, _______, _______, _______, _______ },
    [2] = { _______, _______, _______, _______, _______ },
};

const uint16_t right_halcyon_buttons[10][5] = {
    [0] = { KC_MUTE, _______, _______, _______, _______ },
    [1] = { _______, _______, _______, _______, _______ },
    [2] = { _______, _______, _______, _______, _______ },
};

#endif
```

(Extend layers as needed; unused entries can remain `_______`.)

## 5. Compile

Build using the standard userspace workflow described in the main README.
