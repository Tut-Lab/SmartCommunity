import SvgIcon from "@/components/mobile/SvgIcon.vue";
import MPanel from "@/components/mobile/MPanel.vue";
import BlockLoading from '@/components/mobile/BlockLoading.vue'

export default {
    install: (app, options) => {
        app.component("svg-icon", SvgIcon);
        app.component("MPanel", MPanel);
        app.component('BlockLoading', BlockLoading)
    },
};
