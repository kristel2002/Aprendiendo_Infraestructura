# Aprendiendo_Infraestructura
La finalidad de este repositorio es entender la estructura de este proyecto, paso a paso y a profundidad
, para entender como funcionan cada carpeta

Al revisar la estructura de tu proyecto DermaNube, se observa que sigue un diseño de Microservicios y DevOps avanzado en la nube
## 📐 Estructura del Proyecto

```text
DermaNube-ajustesmenores/
├── .github/
│   └── workflows/
│       └── IntegracionContinua.yml
├── Aplicacion/
│   ├── Frontend/
│   │   ├── public/
│   │   │   ├── recursos/
│   │   │   │   ├── FormulaCapilar.svg
│   │   │   │   ├── FormulaFacial.svg
│   │   │   │   ├── FormulaHidratacion.svg
│   │   │   │   ├── FormulaProteccion.svg
│   │   │   │   ├── HeroDermatologia.svg
│   │   │   │   └── Marca.svg
│   │   │   ├── aplicacion.js
│   │   │   ├── configuracion.ejemplo.js
│   │   │   ├── configuracion.js
│   │   │   ├── estilos.css
│   │   │   └── index.html
│   │   ├── Dockerfile
│   │   └── nginx.conf
│   ├── ProcesadorNotificaciones/
│   │   └── Manejador.py
│   ├── ServicioCitas/
│   │   ├── Pruebas/
│   │   │   └── ServicioCitas.test.js
│   │   ├── src/
│   │   │   ├── Aplicacion.js
│   │   │   ├── CacheHorarios.js
│   │   │   ├── Mensajeria.js
│   │   │   ├── Metricas.js
│   │   │   ├── Registro.js
│   │   │   ├── RepositorioCitas.js
│   │   │   └── Servidor.js
│   │   ├── Dockerfile
│   │   └── package.json
│   ├── ServicioPersonas/
│   │   ├── Pruebas/
│   │   │   └── ServicioPersonas.test.js
│   │   ├── src/
│   │   │   ├── Aplicacion.js
│   │   │   ├── DatosIniciales.js
│   │   │   ├── Metricas.js
│   │   │   ├── Registro.js
│   │   │   ├── RepositorioPersonas.js
│   │   │   └── Servidor.js
│   │   ├── Dockerfile
│   │   └── package.json
│   └── TrabajadorDocumentos/
│       ├── Pruebas/
│       │   └── Documento.test.js
│       ├── src/
│       │   ├── Documento.js
│       │   └── Trabajador.js
│       ├── Dockerfile
│       └── package.json
├── Automatizacion/
│   ├── ActivarServicios.sh
│   ├── CorregirEntornoLocal.ps1
│   ├── CrearEstado.sh
│   ├── DesplegarBase.sh
│   ├── DesplegarCompleto.sh
│   ├── Destruir.sh
│   ├── InicializarDatos.sh
│   ├── PrepararKubernetes.sh
│   ├── PruebasHumo.sh
│   ├── PublicarFrontend.sh
│   ├── PublicarImagenes.sh
│   ├── Reversion.sh
│   └── VerificarHerramientas.sh
├── Documentacion/
│   ├── Arquitectura.md
│   ├── Costos.md
│   ├── DespliegueAWS.md
│   ├── ExcepcionesSeguridad.md
│   └── Pruebas.md
├── Infraestructura/
│   ├── Ansible/
│   │   ├── Inventarios/
│   │   │   └── Produccion.ejemplo.ini
│   │   ├── Playbooks/
│   │   │   └── ConfigurarAutomatizacion.yml
│   │   ├── Roles/
│   │   │   └── ServidorAutomatizacion/
│   │   │       └── tasks/
│   │   │           └── main.yml
│   │   └── ansible.cfg
│   ├── Kubernetes/
│   │   └── TrabajadorDocumentos.yml
│   └── Terraform/
│       ├── Bootstrap/
│       │   ├── Principal.tf
│       │   ├── Salidas.tf
│       │   ├── Variables.tf
│       │   └── Versiones.tf
│       └── Principal/
│           ├── AutenticacionApi.tf
│           ├── Cifrado.tf
│           ├── Contenedores.tf
│           ├── Datos.tf
│           ├── EksJenkins.tf
│           ├── Github.tf
│           ├── Gobierno.tf
│           ├── Locales.tf
│           ├── Mensajeria.tf
│           ├── ObservabilidadAdministrada.tf
│           ├── Presentacion.tf
│           ├── Proveedores.tf
│           ├── Red.tf
│           ├── Registros.tf
│           ├── Salidas.tf
│           ├── Seguridad.tf
│           ├── Variables.tf
│           ├── Versiones.tf
│           └── terraform.tfvars.ejemplo
├── Observabilidad/
│   ├── Alloy/
│   │   └── Configuracion.alloy
│   ├── Grafana/
│   │   ├── Aprovisionamiento/
│   │   │   ├── alerting/
│   │   │   │   ├── PuntosContacto.yml
│   │   │   │   └── Reglas.yml
│   │   │   ├── dashboards/
│   │   │   │   └── Tableros.yml
│   │   │   └── datasources/
│   │   │       └── Fuentes.yml
│   │   └── Tableros/
│   │       └── ResumenDermaNube.json
│   ├── Loki/
│   │   └── Loki.yml
│   └── Prometheus/
│       └── Prometheus.yml
├── Politicas/
│   └── Terraform/
│       └── Seguridad.rego
├── .checkov.yml
├── .env.ejemplo
├── .gitattributes
├── .gitignore
├── docker-compose.yml
├── Jenkinsfile
├── LICENSE
├── package-lock.json
├── package.json
├── README.md
└── sonar-project.properties
