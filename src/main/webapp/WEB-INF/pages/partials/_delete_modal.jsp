<script>
    function openDeleteModal(url, name) {
        $("#deleteText").html("Eliminar " + name);
        $("#deleteLink").attr("href", url);
        $('#deleteModal').modal();
    }
</script>

<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" id="deleteText"></div>
            <div class="modal-body">Esta seguro que desea eliminar?</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cancelar</button>
                <a id="deleteLink" href="" class="btn btn-danger btn-sm">Eliminar</a>
            </div>
        </div>
    </div>
</div>