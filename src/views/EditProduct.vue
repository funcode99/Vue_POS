<template>
  <div class="width-box">
    <form @submit="editProduct">
      <h3 class="text-center">Update product here</h3>
      <div class="form-group">
        <label for="exampleInputEmail1">Id</label>
        <input
          type="number"
          class="form-control text-left"
          id="exampleInputEmail1"
          aria-describedby="emailHelp"
          :value="thisUrl"
          disabled
        />
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">Name</label>
        <input
          type="text"
          class="form-control text-left"
          aria-describedby="emailHelp"
          v-model="editableData[0].productname"
        />
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Image</label>
        <input
          type="text"
          class="form-control text-left"
          aria-describedby="emailHelp"
          v-model="editableData[0].image"
        />
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Price</label>
        <input
          type="number"
          min = "1000"
          max = "300000"
          class="form-control text-left"
          aria-describedby="emailHelp"
          v-model="editableData[0].price"
        />
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Category</label>
        <input
          min = "1"
          max = "3"
          type="number"
          class="form-control text-left"
          aria-describedby="emailHelp"
          v-model="editableData[0].categoryID"
        />
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
</template>

<script>
import axios from "axios"
export default {
  name: "editProduct",
  data: function () {
    return {
      editableData: [],
      thisUrl: this.$route.query.id,
    }
  },
  methods: {
    getDetails() {
      axios
        .get(process.env.VUE_APP_MAIN_URL +`details?id=${this.thisUrl}`)
        .then((res) => {
          this.editableData = res.data
          console.log(res.data)
        })
    },
    editProduct() {
      axios
        .put(process.env.VUE_APP_MAIN_URL + `?id=${this.thisUrl}&name=${this.editableData[0].productname}&price=${this.editableData[0].price}&image=${this.editableData[0].image}&categoryID=${this.editableData[0].categoryID}` 
        )
        .then((res) => {
          console.log(res)
          alert("Success edit product")
          window.location.href = "http://localhost:8080"
        })
        .catch((err) => console.log(err))
    },
  },
  mounted() {
    this.getDetails()
  },
}
</script>

<style scoped>
.width-box {
  width: 500px;
  margin: auto;
}

.form-control {
  font-size : 25px;
}
</style>