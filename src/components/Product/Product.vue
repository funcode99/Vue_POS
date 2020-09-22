<template>
  <div v-if="dataProduct.length > 0">
    <div class="food-menu">
      <span v-for="item in dataProduct" :key="item.id">
        <div class="menu" :value="item.id">
          <img @click="$updateCart(item.id)" src="@/img/bear.png" v-bind:alt="item.name" />
          <h3 class="font-menu">{{item.name}}</h3>
          <p>{{new Intl.NumberFormat('id-ID', { maximumSignificantDigits: 3 }).format(item.price)}}</p>
        </div>
      </span>
    </div>
  </div>
  <div v-else>
    <div class="food-menu">
      <h1>Product not found.</h1>
    </div>
  </div>
</template>

<script socped>
export default {
  name: "Product",
  props: {
    dataProduct: {
      type: Array,
    },
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Barlow:wght@300&display=swap");
.food-menu {
  display: flex;
  width: 793px;
  height: 940px;
  flex-wrap: wrap;
  background: rgba(190, 195, 202, 0.3);
}
.menu {
  margin: 8px 5px 5px 5px;
  margin-left: 8px;
  width: 251px;
  height: 267px;
}
.font-menu {
  margin: 0;
  font-family: "Barlow", sans-serif;
  color: #000000;
  font-size: 25px;
  line-height: 33px;
}
</style>
