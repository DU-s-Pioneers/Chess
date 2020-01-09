function renderPieces() {
  makeSortable();
}


function makeSortable() {
  Sortable.create($piecesContainer[0], {
    animation: 150,
    easing: 'cubic-bezier(0.785, 0.135, 0.15, 0.86)'
  });
}