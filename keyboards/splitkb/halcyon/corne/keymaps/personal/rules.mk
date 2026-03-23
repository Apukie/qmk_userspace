# ============================================================
#  rules.mk – apukie keymap
#  splitkb Halcyon Corne rev2
# ============================================================

# Halcyon module support (TFT display, Cirque trackpad, encoder)
# Compile with: -e HLC_TFT_DISPLAY=1 or -e HLC_CIRQUE_TRACKPAD=1
USER_NAME := halcyon_modules

# Combos (bracket combos, ESC, CapsWord, SPC+ENT→SYS, etc.)
COMBO_ENABLE = yes

# Caps Word  (toggle with KL combo)
CAPS_WORD_ENABLE = yes

# Key Overrides  (Shift+,→;  Shift+.→:)
KEY_OVERRIDE_ENABLE = yes

# RGB Matrix  (per-key RGB, 27 LEDs per side)
RGB_MATRIX_ENABLE = yes

# ─────────────────────────────────────────
# Optional: uncomment to enable mouse keys
# on a future MOUSE layer
# ─────────────────────────────────────────
# MOUSEKEY_ENABLE = yes
