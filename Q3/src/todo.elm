import Browser
import Html exposing (..)
import Html.Events exposing (onClick, onInput, onMouseEnter)
import Html.Attributes exposing (..)


main = Browser.sandbox{init = init, 
                       update = update, 
                       view = view}
-- MODEL

type alias Model = 
    { todo : String,
      todos : List Entry,
      counter : Int 
    }

type alias Entry = 
    {desc : String,
     id : Int
     }

init : Model
init = 
    { todo = "",
    todos = [],
    counter = 0
    }


-- UPDATE

type Msg = UpdateTodo String | SaveTodo | ClearList | DeleteEntry Int

update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateTodo text ->
            {model | todo = text}

        SaveTodo ->
            if model.todo == "" then
                model
            else
            { model | counter = model.counter + 1,
                      todos =  model.todos ++ [Entry model.todo (model.counter + 1)],
                      todo = ""}
        
        DeleteEntry id ->
            { model | todos = List.filter (\x -> x.id /= id) model.todos }

        ClearList ->
            { model | todos = []}


-- VIEW
view : Model -> Html Msg
view model = 
    div [class "mdl-grid"] 
    [   div [class "mdl-cell  mdl-cell--12-col"] [h1[class "mdl-typography--display-4"][text "Simple Todo List"]],
        inputField model.todo,
        buttonRow,
        todoList model.todos
              
    ] 

todoItem : Entry -> Html Msg
todoItem todo = 
    li [class "mdl-list__item"][span[class "mdl-list__item-primary-content"][i [class "material-icons"][text "arrow_forward_ios"],
                                text todo.desc],
                                span[class "mdl-list__item-secondary-action"][
                                button[class "mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab",
                                        onClick (DeleteEntry todo.id)][i[class "material-icons"][text "delete"]]]
                               ]

todoList : List Entry -> Html Msg
todoList todos = 
    if List.isEmpty todos then
     
        div[class "mdl-card mdl-cell mdl-cell--6-col mdl-shadow--2dp"][ul [class "mdl-list"] [h3[class "mdl-typography--headline"][text "List is empty!"]] ]
    else
        let item = List.map todoItem todos
        in div[class "mdl-card mdl-cell mdl-cell--6-col mdl-shadow--2dp"][ul [class "mdl-list"] item]

inputField : String -> Html Msg
inputField todo = 
    div [class "mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell  mdl-cell--9-col"]
        [input [type_ "text", class "mdl-textfield__input",
                onInput UpdateTodo,
                value todo]
                 [], 
                 label [class "mdl-textfield__label"] [text "What do you want to do today...?"]]
    

buttonRow =
    div [class "mdl-cell mdl-cell--12-col"][button [class "mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent mainButton mdl-cell--3-col", onClick SaveTodo][text "Add To List"],
        button [class "mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent mainButton mdl-cell--3-col", onClick ClearList][text "Clear List"]] 
