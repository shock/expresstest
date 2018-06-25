// This shit doesn't work!
handleMethod = function(link) {
  var href = link.getAttribute('href');
  var method = link.getAttribute('_method');
  var form = document.createElement("form");
  var metadataInput = document.createElement("input");

  form.setAttribute("method","post");
  form.setAttribute("action",href);
  form.setAttribute("style","display: none");
  metadataInput.setAttribute("name", "_method");
  metadataInput.setAttribute("value", method);
  metadataInput.setAttribute("type", "hidden");
  form.appendChild(metadataInput);
  document.body.appendChild(form);
  form.submit();
  return true;
};