import Browser
import Html exposing (Html, button, div, span, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
import Random


-- MAIN

main =
  Browser.element 
    { init = init
    , subscriptions = subscriptions
    , update = update
    , view = view
    }


-- MODEL

type alias Model =
  { number : Int
  }

init : () -> (Model, Cmd Msg)
init _ =
  (Model 0
  , Cmd.none
  )


-- UPDATE

type Msg 
  = Increment Int
  | Decrement Int
  | Reset

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Increment n ->
      (Model (model.number + n), Cmd.none)

    Decrement n ->
      (Model (model.number - n), Cmd.none)

    Reset ->
      (Model 0, Cmd.none)


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- VIEW

numberStyle : List (Html.Attribute msg)
numberStyle =
  [ style "width" "5em"
  , style "display" "inline-block"
  , style "text-align" "center"
  ]

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick (Decrement 2) ] [ text "-2" ]
    , button [ onClick (Decrement 1) ] [ text "-" ]
    , span numberStyle [ text (String.fromInt model.number) ]
    , button [ onClick (Increment 1) ] [ text "+" ]
    , button [ onClick (Increment 2) ] [ text "+2" ]
    , button [ onClick Reset ] [ text "Reset" ]
    ]