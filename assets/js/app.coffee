# this file describes the angular app the runs alongside the snap.svg application
# to draw feynman diagrams
# author: alec aivazis

# create the angular module 
app = angular.module 'feynman', ['colorpicker.module', 'uiSlider']
# define the controller for the properties menu
app.controller 'elementProperties', ['$scope',  '$rootScope', ($scope, $rootScope) ->
  # when an element is selected in snap the event gets propagated through jquery
  $(document).on 'selectedLine', (event, line) ->

    # load the elements properties into the ui 
    $scope.stroke = line.element.attr 'stroke'

    # fucking ui-slider
    $scope.width = line.width
    
    # set the selected element
    $scope.selectedLine = line
    console.log line.width
    # apply the change since this is technically done in the jquery environment
    $scope.$apply()

  # update the properties of the appropriate element when we change the selectedLines 
  # the only reason to do this is because snap attributes are not settable with foo.bar = 2
  $scope.$watch 'stroke', (newVal, oldVal) ->
    if $scope.selectedLine
      $scope.selectedLine.stroke = newVal
      $scope.selectedLine.element.attr 'stroke', newVal

  $scope.$watch 'width', (newVal, oldVal) ->
    if $scope.selectedLine
      $scope.selectedLine.width = newVal
      $scope.selectedLine.draw()

  # if they set the label
  $scope.$watch 'selectedLine.label', (newVal, oldVal) ->
    # we need to tell the element to redraw by hand to incorporate the new label 
    if $scope.selectedLine
      $scope.selectedLine.drawLabel()

  # if they change the line style
  $scope.$watch 'selectedLine.style', (newVal, oldVal) ->
    if $scope.selectedLine
      $scope.selectedLine.draw()

  $scope.$watch 'selectedLine.loopDirection', (newVal, oldVal) ->
    if $scope.selectedLine
      $scope.selectedLine.draw()

  # if they change the line style
  $scope.$watch 'selectedLine.labelPosition', (newVal, oldVal) ->
    if $scope.selectedLine
      $scope.selectedLine.drawLabel()
    

]