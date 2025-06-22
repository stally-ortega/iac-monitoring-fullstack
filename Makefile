# === CONFIGURACIÓN ===
SUBMODULES := angular_client backend_api
BRANCH := main

.PHONY: update-submodules

update-submodules:
	@echo "🔁 Actualizando submódulos y referencia en el repo principal..."

	@for submodule in $(SUBMODULES); do \
		echo "➡️ Entrando en submódulo: $$submodule"; \
		cd $$submodule || exit 1; \
		git checkout $(BRANCH); \
		git pull origin $(BRANCH); \
		read -p "📝 ¿Quieres hacer commit en $$submodule? [y/N] " do_commit; \
		if [ "$$do_commit" = "y" ] || [ "$$do_commit" = "Y" ]; then \
			git add .; \
			read -p "✍️ Mensaje del commit: " commit_msg; \
			git commit -m "$$commit_msg"; \
			git push origin $(BRANCH); \
		else \
			echo "⏭️  Omitiendo commit en $$submodule"; \
		fi; \
		cd ..; \
	done

	read -p "📝 ¿Quieres hacer commit en REPOSITORIO_PRINCIPAL? [y/N] " do_commit;
	if [ "$$do_commit" = "y" ] || [ "$$do_commit" = "Y" ]; then
		@echo "📌 Agregando nuevas referencias al repo raíz..."
		git add $(SUBMODULES)
		git commit -m "chore: update submodules to latest commits"
		git push origin $(BRANCH)
		@echo "✅ ¡Submódulos actualizados y referenciados en el repo principal!"
	else
		echo "⏭️  Omitiendo commit en REPOSITORIO_PRINCIPAL";
	fi;