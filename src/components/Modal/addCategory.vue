<template>
  <b-modal id="modal-category" hide-footer="true" hide-header="true">
    <div class="box-modal-3">
      <div class="container mt-3">
        <h3>Add Category</h3>
        <div class="mt-5"></div>
        <div class="row">
          <div class="col-3">
            <h5>Name</h5>
          </div>
          <div class="col">
            <input class="form-control" />
          </div>
        </div>
        <div class="mt-3"></div>
        <div class="row justify-content-end">
          <div class="col-2">
            <button class="btn button-cancel-item">Cancel</button>
          </div>
          <div class="col-2">
            <button class="btn button-add-item">Add</button>
          </div>
        </div>
      </div>
    </div>
  </b-modal>
</template>

<script>
export default {
  name: "addModal",
}
</script>

<style scoped>
.button-cancel-item {
  color: #ffffff;
  background: #f24f8a;
}
.button-add-item {
  color: #ffffff;
  background: #57cad5;
}
.box-modal-3 h5,
.box-modal-3 h3 {
  font-family: "Barlow", sans-serif;
  font-weight: bold;
}
</style>