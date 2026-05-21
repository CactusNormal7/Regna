export default defineNuxtConfig({
  modules: ['@vite-pwa/nuxt'],
  pwa: {
    manifest: {
      name: 'Regna',
      short_name: 'Regna',
      theme_color: '#3D5AFE'
    }
  }
})