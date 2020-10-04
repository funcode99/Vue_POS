<template>
  <div id="app">
    <nav class="navbar navbar-light ">
      <a class="navbar-brand" href="#">
        <img
          src="@/icons/burger-menu.png"
          alt="burger-menu"
          width="30"
          height="30"
          loading="lazy"
          class="d-inline-block align-top"
        />
      </a>

      <div class="justify-content-center mx-auto">
        <div class="food-name-brand mx-auto">
          <h1 class="title">Food Items</h1>
        </div>
      </div>
      <div style="margin-right: 200px;">
        <div v-if="searchForms == false">
        <img
          @click="searchFormsToggle"
          class="search-menu"
          src="@/icons/magnifying-glass.png"
          alt
        />
        </div>
        <div v-if="searchForms == true">
          <div class="row">
            <b-dropdown id="dropdown-1" text="Filter Product" class="">
              <b-dropdown-item @click="sortProduct('Name')"
                >Name</b-dropdown-item
              >
              <b-dropdown-item @click="sortProduct('HighestPrice')"
                >Highest Price</b-dropdown-item
              >
              <b-dropdown-item @click="sortProduct('LowestPrice')"
                >Lowest Price</b-dropdown-item
              >
            </b-dropdown>

            <form @submit="searchProduct" onsubmit="return false">
              <input
                class="form-control"
                type="text"
                placeholder="Search here"
                aria-label="Search"
                v-model="search"
              />
            </form>
            <b-button-close  @click="searchFormsToggle"></b-button-close>
          </div>
        </div>
      </div>

      <div class="food-name-cart" style="margin-right:110px;">
        <h1 class="cart-text">
          Cart<span
            class="box-cart"
            style="background-color:#57CAD5; border-radius:100px; color:white;"
            >{{ cart.data.length }}</span
          >
        </h1>
      </div>
    </nav>

    <section id="main-side-aside">
      <div class="row">
        <div
          class="col-2 col-sm-2 col-md-1 "
          style="background-color:#ffff; height:90vh;"
        >
          <div class="sidebar">
            <router-link to="/">
              <img
                class="fork-icon"
                click
                src="@/icons/fork.png"
                alt="Clipboard Menu"
                width="40"
                height="40"
              />
            </router-link>
            <router-link to="/history">
              <img
                class="fork-icon"
                click
                src="@/icons/clipboard.png"
                alt="Clipboard Menu"
                width="40"
                height="40"
              />
            </router-link>
            <button class="btn mt-4" v-b-modal.modal-add>
              <img class="fork-icon-2" src="@/icons/add.png" width="45" height="45" />
            </button>
            <button class="btn mt-3" v-b-modal.modal-delete-product>
              <img class="fork-icon-2" src="@/icons/delete.png" width="45" height="45" alt />
            </button>
          </div>
        </div>

        <!-- <div v-if="searchForms == true">
          <b-dropdown id="dropdown-1" text="Filter Product" class="">
            <b-dropdown-item @click="sortProduct('Name')">Name</b-dropdown-item>
            <b-dropdown-item @click="sortProduct('HighestPrice')"
              >Highest Price</b-dropdown-item
            >
            <b-dropdown-item @click="sortProduct('LowestPrice')"
              >Lowest Price</b-dropdown-item
            >
          </b-dropdown>

          <form @submit="searchProduct" onsubmit="return false">
            <input
              class="form-control"
              type="text"
              placeholder="Search here"
              aria-label="Search"
              v-model="search"
            />
          </form>
        </div> -->

        <div class="col-10 col-sm-10 col-md-8 mt-1 ">
           <div class="card d-inline-block mt-3">
          <div v-if="listProduct.length > 0" >
              <div :value="item.id" v-for="item in listProduct" :key="item.id" class='d-inline-block' >
                <img
                  :src="'http://localhost:1999/'+item.Image"
                  v-bind:alt="item.name"
                  width="250"
                  height="200"
                />

                <div class="card-body">
                  <router-link :to="{ path: 'edit', query: { id: item.id } }">
                    <h3 class="font-menu">{{ item.productname }}</h3>
                  </router-link>
                  <p @click="updateCart(item.id)">
                    {{
                      new Intl.NumberFormat("id-ID", {
                        maximumSignificantDigits: 3,
                      }).format(item.price)
                    }}
                  </p>
                </div>
              </div>
            
          </div>

          <div v-else-if="listProduct.length <= 0">
            <div class="food-menu">
              <h1>Product not found</h1>
            </div>
          </div>
          </div>
        </div>

        <div
          class="col-12 col-sm-12 col-md-3 mb-4"
          style="background-color: #abc; height: 90vh;"
        >
          <div v-if="cart.data.length == 0">
            <div class="" style="text-align: center;">
              <img src="@/icons/food-and-restaurant.png" />
              <h6 style="margin-top:-45px;">Your cart is empty</h6>
              <small style="color:gray;">
                <h5>Please add some items from the menu</h5>
              </small>
            </div>
          </div>

          <div v-else>
            <div class="card-listed">
              <div class="card mt-3">
                <div class="row no-gutters">
                  <div class="row" v-for="item in cart.data" :key="item.id">
                    <div class="col-4 mt-2 ml-2">
                      <img
                        class="checkout-img"
                        :src="'http://localhost:1999/'+item.Image"
                        width="100"
                        height="100"
                        alt
                      />
                    </div>
                    <!-- <div class="col-4 ml-3 mt-2"> -->
                    <h3 class="title-menu">{{ item.productname }}</h3>
                    <div class="flex-checkout ml-3">
                      <h4 class="price">
                        Rp
                        {{
                          new Intl.NumberFormat("id-ID", {
                            maximumSignificantDigits: 3,
                          }).format(item.price)
                        }}
                      </h4>
                    </div>
                    <!-- </div> -->
                  </div>

                  <div class="container">
                    <div class="row">
                      <h4 class="total-price-text">Total:</h4>
                      <h6>*Belum termasuk ppn</h6>

                      <div class="col-12">
                        <h4 class="total-price-text text-right">
                          Rp
                          {{
                            new Intl.NumberFormat("id-ID", {
                              maximumSignificantDigits: 3,
                            }).format(cart.price)
                          }}
                        </h4>
                      </div>
                    </div>
                  </div>

                  <button
                    class="btn btn-checkout"
                    data-toggle="modal"
                    data-target="#exampleModal"
                  >
                    Checkout
                  </button>
                  <button class="btn btn-cancel">Cancel</button>
                </div>
              </div>
            </div>
          </div>
        </div>

        <addProductModal />
        <addCategoryModal />
        <deleteProductModal />
      </div>
    </section>
  </div>
</template>

<script>
import $ from "jquery";
import axios from "axios";
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";

import addProductModal from "@/components/Modal/addProduct";
import addCategoryModal from "@/components/Modal/addCategory";
import deleteProductModal from "@/components/Modal/deleteProduct";
// OH TERNYATA GINI TOH CARA MANGGIL COMPONENT!!

export default {
  name: "App",
  data: function() {
    return {
      listProduct: [],
      cart: {
        data: [],
        price: 0,
      },
      search: "",
      searchForms: false,
    };
  },
  methods: {
    niceNumber() {
      $(function() {
        $('input[type="number"]').niceNumber();
      });
    },
    getProduct() {
      axios
        .get(process.env.VUE_APP_MAIN_URL)
        .then((res) => {
          console.log(res);
          this.listProduct = res.data;
        })
        .catch((err) => {
          console.log(err);
          this.listProduct = [];
        });
    },
    sortProduct(category) {
      let url;
      if (category == "Name") {
        url = "sortName";
      } else if (category == "HighestPrice") {
        url = "sortHighestPrice";
      } else if (category == "LowestPrice") {
        url = "sortLowestPrice";
      }

      axios
        .get(process.env.VUE_APP_MAIN_URL + `${url}`)
        .then((res) => {
          console.log("filter has been completed");
          console.log(res);
          this.listProduct = res.data;
        })
        .catch((err) => {
          console.log(err);
          this.listProduct = [];
        });
    },
    searchProduct() {
      axios
        .get(process.env.VUE_APP_MAIN_URL + `search?name=${this.search}`)
        .then((res) => {
          console.log("search has been completed");
          console.log(res);
          this.listProduct = res.data;
        })
        .catch((err) => {
          console.log(err);
          console.log("search failed");
          this.listProduct = [];
        });
    },
    searchFormsToggle() {
      if (this.searchForms == true) {
        this.searchForms = false;
      } else {
        this.searchForms = true;
      }
    },
    updateCart(id) {
      let data = this.listProduct.find((product) => product.id == id);
      console.log(this.listProduct);
      console.log(!this.listProduct.map((x) => x.id).includes(id));

      if (!this.cart.data.map((x) => x.id).includes(id)) {
        this.cart.data.push(data);
        this.cart.price = this.cart.price + Number(data.price);
      }
    },
  },

  mounted() {
    this.getProduct();
  },
  components: {
    addProductModal,
    addCategoryModal,
    deleteProductModal,
  },
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Barlow:wght@300&display=swap");

.width {
  width : 100%;
}

.price {
  font-family: "Barlow", sans-serif;
  font-size: 20px;
  line-height: 26px;
  color: #000000;
  margin-top: 15px;
  margin-left: 90px;
  font-weight: bold;
  text-align: right;
}

.title-menu {
  margin-left: 10px;
  font-family: "Barlow", sans-serif;
  font-size: 20px;
  line-height: 33px;
  color: #000000;
}

.font-menu {
  margin: 0;
  font-family: "Airbnb Cereal App Book", sans-serif;
  color: #000000;
  font-size: 25px;
  line-height: 33px;
}

.fork-icon {
  margin-top: 32.48px;
  margin-left: 17px;
}

.cart {
  width: 443px;
}

.box-cart {
  margin-top: 40px;
  margin-left: 5px;
  padding-top: 2px;
  width: 35px;
  height: 35px;
  font-family: "Barlow", sans-serif;
  border-radius: 50%;
  text-align: center;
  font-weight: bold;
  background: #57cad5;
  color: white;
}

.flex-checkout {
  display: flex;
}

.btn-checkout {
  font-size: 25px;
  line-height: 33px;
  margin-left: 20px;
  width: 401px;
  height: 61px;
  color: #ffffff;
  background: #57cad5;
}
.btn-cancel {
  margin-top: 10px;
  font-size: 25px;
  line-height: 33px;
  margin-left: 20px;
  width: 401px;
  height: 61px;
  color: #ffffff;
  background: #f24f8a;
}

input {
  width: 50px;
  height: 50px;
  text-align: center;
  vertical-align: middle;
}

body {
  background-color: #e5e5e5;
}

/* Navbar */
.navbar {
  background-color: #ffffff;
  box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.2);
}

.navbar-brand {
  margin-left: 10px;
}

.food-name-cart {
  margin-right: 40px;
}

/* end navbar */

/* Sidebar */

.col-md-1 {
  box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.1);
  height: 90vh;
}

.sidebar img {
  margin-top: 15px;
}

/* end of Sidebar */

/* Main bar */
.col-md-7 {
  padding-left: 10px;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
   align-items: center;
  overflow-y: scroll;
  height: 90vh;
  position: static;
}

.card-body {
  width : 200px;
}

.col-md-7 .card {
  width: -20px;
  /* width : 100%; */
  margin-left: 10px;
  background-color: transparent;
  border-color: transparent;
}

.col-md-8 {
  padding-left: 20px;
  display: flex;
  flex-wrap: wrap;
  overflow-y: scroll;
  height: 90vh;
  position: static;
   /* justify-content: left;
   align-items: center; */
}

.col-md-8 .card {
  /* width: 20px; */
  margin-left: 10px;
  background-color: transparent;
  border-color: transparent;
}

/* end of main bar */

/* Aside bar */
.col-md-3 .card {
  height: 100px;
  display: flex;
  background-color: transparent;
  border-color: transparent;
  display: flex;
  flex-wrap: wrap;
  overflow-y: scroll;
  height: 90vh;
  position: static;
}

/* .col-md-3 .card .no-gutters .card-body h5 { */
  /* margin-top: -20px; */
/* } */

.col-md-3 .card .no-gutters .card-body input {
  margin-top: 10px;
  height: 24px;
  width: 30px;
  border-color: transparent;
  color: yellowgreen;
  font-weight: bold;
}

.col-md-3 .card .no-gutters .card-body button {
  margin-top: 10px;
  height: 30px;
  width: 30px;
  border-color: transparent;
  color: yellowgreen;
  font-weight: bold;
}

.col-md-3 .card .no-gutters .card-body h6 {
  margin-top: 9px;
  text-align: right;
}

.price-total-cart {
  margin-top: 20px;
}

.col-md-3 .button-checkout-cancel {
  display: flex;
  flex-direction: column;
  margin-top: 30px;
  padding-right: 8px;
}

.col-md-3 .button-checkout-cancel button {
  width: 100%;
  height: 40px;
}

.btn-cancel {
width : 40%;
height: 50px;
margin : auto;
}

.btn-checkout {
width : 50%;
height : 50px;
margin : auto;
}


.col-md-3 .button-checkout-cancel .button-checkout button {
  background-color: #57cad5;
  border: none;
  color: #ffffff;
}

.col-md-3 .button-checkout-cancel .button-cancel button {
  margin-top: 10px;
  background-color: #f24f8a;
  border: none;
  color: #ffffff;
}

/* Modal  */

/* Modal Checkout */
.modal-button-added {
  background-color: transparent;
  border: none;
}

.modal-button-added::after {
  border: none;
}

.modal-button-added img {
  width: 40px;
  height: 40px;
  margin-left: -5px;
  border: none;
}
/* end modal checkout */

/* Modal Added */

.form-control {
  box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.2);
}

.buttons-modal-decision .btn-modal-cancel {
  background-color: #f24f8a;
  color: #ffff;
}

.buttons-modal-decision .btn-modal-add {
  background-color: #57cad5;
  color: #ffff;
}
/* end modal added */

@font-face {
  font-family: "Airbnb Cereal App Medium";
  font-style: normal;
  font-weight: normal;
  src: local("Airbnb Cereal App Medium"),
    url("AirbnbCerealMedium.woff") format("woff");
}

@font-face {
  font-family: "Airbnb Cereal App Book";
  font-style: normal;
  font-weight: normal;
  src: local("Airbnb Cereal App Book"),
    url("AirbnbCerealBook.woff") format("woff");
}

@font-face {
  font-family: "Airbnb Cereal App Black";
  font-style: normal;
  font-weight: normal;
  src: local("Airbnb Cereal App Black"),
    url("AirbnbCerealBlack.woff") format("woff");
}

p {
  font-family: Airbnb Cereal App Book;
  font-size: 20px;
}

h5 {
  font-family: Airbnb Cereal App Book;
  font-size: 25px;
}

h6 {
  font-family: Airbnb Cereal App Black;
  font-size: 25px;
}

span {
  font-family: Airbnb Cereal App Black;
  font-size: 20px;
}

.button {
  width: 6em;
}
</style>
