// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
$(document).on('submit', '#frm_CrearFactura', function (e) {
    e.preventDefault();
    $.ajax({
        beforeSend: function () {
            $("#frm_CrearFactura button[type=submit]").prop("disabled", true);
        },
        type: this.method,
        url: this.action,
        data: $(this).serialize(),
        success: function (data) {
            alert("Su factura se creado con éxito!.");
        },
        error: function (xhr, status) {
            alert(xhr.responseJSON.Message);
        },
        complete: function () {
            $("#frm_CrearFactura button[type=submit]").prop("disabled", false);
        }
    })
})