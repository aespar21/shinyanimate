#' Set up Shiny app to use animation
#'
#' This function needs to be added in the UI if to want to add animation to your UI elements using shinyanimate.
#' @export
#' @examples
#' if(interactive()){withAnim()}
#' @seealso \code{\link{startAnim}}
withAnim <- function(){
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(shiny::tags$link(rel="stylesheet",href="assets/animate.min.css"))
    ),
    shiny::singleton(
      shiny::tags$script(src="assets/addClass.js")
    ),
    shiny::singleton(
      shiny::tags$script(src="assets/scrollAnimation.js")
    )
  )
}

#'Start an animation
#'
#' Start an animation of the UI element.
#' @export
#' @param id the id of the UI element for which you want to add animation.
#' @param type The type of animation to use, valid values correspond to the types in \url{https://daneden.github.io/animate.css/}
#' @examples
#'if(interactive()){
#'library(shiny)
#'library(shinyanimate)
#'ui <- fluidPage(
#'  withAnim(),
#'  tags$div(id = 'title', h1('ANIMATION')),
#'  actionButton(inputId = "button", label = "Animate")
#')
#'server <- function(input, output, session){
#'  observeEvent(input$button,{
#'    startAnim('title', 'bounce')
#'  })
#'}
#'if(interactive()) shinyApp(ui, server)
#'}
#'@seealso \code{\link{withAnim}}
#'
startAnim <- function(id, type = NULL){
	session <- shiny::getDefaultReactiveDomain()
  session$sendCustomMessage(
    type = "addClass",
    message = list(ele = id, name = type))
}

#' Add animation on mouse hover for UI element.
#' @export
#' @param id the id of the UI element for which you want animation on mouse hover.
#' @param type The type of animation to use, valid values correspond to the types in \url{https://daneden.github.io/animate.css/}
#' @examples
#' if(interactive()){
#' library(shiny)
#' library(shinyanimate)
#' ui <- fluidPage(
#'   withAnim(),
#'     tags$div(id = 'title', h1('HOVER ON ME'))
#'     )
#' server <- function(input, output, session){
#'   observe(addHoverAnim('title', 'bounce'))
#'  }
#'if(interactive()) shinyApp(ui, server)
#'}
#'@seealso \code{\link{withAnim}}
#'
addHoverAnim <- function(id, type = NULL) {
	session <- shiny::getDefaultReactiveDomain()
  session$sendCustomMessage(
    type = "addClassHover",
    message = list(ele = id, name = type))
}

#' Add animation on scroll for UI element.
#' @export
#' @param id the id of the UI element for which you want animation on scroll.
#' @param type The type of animation to use, valid values correspond to the types in \url{https://daneden.github.io/animate.css/}
#' @examples
#' if(interactive()){
#' library(shiny)
#' library(shinyanimate)
#' ui <- fluidPage(
#'   withAnim(),
#'     tags$h1('Scroll below to see an animation'),
#'     br(), br(), br(), br(), br(), br(), br(),
#'     br(), br(), br(), br(), br(), br(), br(),
#'     br(), br(), br(), br(), br(), br(), br(),
#'     br(), br(), br(), br(), br(), br(), br(),
#'     br(), br(), br(), br(), br(), br(), br(),
#'     br(), br(), br(), br(), br(), br(), br(),
#'     tags$div(id = 'title', h1('I ANIMATE ON SCROLL'))
#'     )
#' server <- function(input, output, session){
#'   observe(addScrollAnim('title', 'bounce'))
#'  }
#'if(interactive()) shinyApp(ui, server)
#'}
#'@seealso \code{\link{withAnim}}
#'
addScrollAnim <- function(id, type = NULL) {
	session <- shiny::getDefaultReactiveDomain()
  session$sendCustomMessage(
    type = "addClassScroll",
    message = list(ele = id, name = type))
}

