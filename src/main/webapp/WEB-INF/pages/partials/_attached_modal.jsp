<script>
    function openAttachedModal(url) {
        $("#attachedImage").attr("src", url);
        $("#attachedText").html(url);
        $('#attachedModal').modal();
    }
</script>

<div id="attachedModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <figure class="figure">
                    <img id="attachedImage" class="figure-img img-fluid">
                    <figcaption id="attachedText" class="figure-caption"></figcaption>
                </figure>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>