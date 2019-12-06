module Main exposing (..)

import Browser
import Html exposing (Html, div, h1, img, input, text)
import Html.Attributes exposing (src)
import Html.Events exposing (onInput)



---- MODEL ----


type alias Model =
    { firstName : String
    , lastName : String
    }


init : ( Model, Cmd Msg )
init =
    ( { firstName = "Davis"
      , lastName = "Lucky"
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = NoOp
    | GotInput String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GotInput name ->
            ( { model
                | firstName = name
              }
            , Cmd.none
            )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text (model.firstName ++ " " ++ model.lastName) ]
        , input [ onInput GotInput ] []
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
