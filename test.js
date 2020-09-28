${!!is_logged_in ? `
<a href="/users/logout" class="button is-light">Logout</a>
` : `
<a href="/users/login" class="button is-light">Log in</a>
`} 