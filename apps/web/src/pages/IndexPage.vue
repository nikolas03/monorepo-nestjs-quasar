<template>
  <q-page class="column items-center justify-evenly">
    <h1>Hello world</h1>
    <span>{{ apiText }}</span>
  </q-page>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';

export default defineComponent({
  name: 'IndexPage',
  data: () => {
    return {
      apiText: ref(''),
    };
  },
  async mounted() {
    const { data } = await this.$api.get('/helloworld');
    this.apiText = data;
  },
});
</script>
