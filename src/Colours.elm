module Colours exposing
  ( Colour
  , toCss
  , withAlpha
  , black
  , red
  )

type Colour
  = RGB Int Int Int
  | RGBA Int Int Int Float

toCss : Colour -> String
toCss colour =
  case colour of
    RGB r g b ->
      "rgb(" ++ (String.fromInt r) ++ "," ++ (String.fromInt g) ++ "," ++ (String.fromInt b) ++ ")"

    RGBA r g b a ->
      "rgba(" ++ (String.fromInt r) ++ "," ++ (String.fromInt g) ++ "," ++ (String.fromInt b) ++ "," ++ (String.fromFloat a) ++ ")"

withAlpha : Float -> Colour -> Colour
withAlpha alpha colour =
  case colour of
    RGB r g b ->
      RGBA r g b alpha
    
    RGBA r g b _ ->
      RGBA r g b alpha

black : Colour
black = RGB 0 0 0

red : Colour
red = RGB 255 0 0
