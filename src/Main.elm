module Main exposing (..)

import Browser
import Debug exposing (log)
import Html exposing (button, div, input, text)
import Html.Events exposing (onClick, onInput)
import String exposing (fromInt, toInt)


parseUserNumber text =
    let
        maybeText =
            toInt text
    in
    case maybeText of
        Just val ->
            val

        Nothing ->
            0


type Messages
    = ClickedAdd
    | ChangedAddText String


init =
    { value = 0, numberToAdd = 1 }


view model =
    div []
        [ text (fromInt model.value)
        , div [] []
        , input [ onInput ChangedAddText ] []
        , button [ onClick ClickedAdd ] [ text "Add" ]
        ]


update msg model =
    let
        log1 =
            log "msg" msg

        log2 =
            log "model" model
    in
    case msg of
        ClickedAdd ->
            { model | value = model.value + model.numberToAdd }

        ChangedAddText text ->
            { model | numberToAdd = parseUserNumber text }


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }
