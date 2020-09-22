import Vue from "vue"
import VueRouter from "vue-router"

Vue.use(VueRouter)

import home from "@/views/Home"
import history from "@/views/History"
import editProduct from "@/views/EditProduct"

const Router = new VueRouter({
    routes: [
        {
            path: "/",
            name: "Home",
            component: home,
        },
        {
            path: "/History",
            name: "History",
            component: history,
        },
        {
            path: "/edit",
            name: "EditProduct",
            component: editProduct,
            props: route => ({ query: route.query.q })
        },
        
    ],mode: 'history'
})

export default Router