import React from "react"
import WebpackerReact from "webpacker-react"
import PropTypes from "prop-types"
import { makeStyles } from '@material-ui/core/styles';
import CssBaseline from '@material-ui/core/CssBaseline';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Paper from '@material-ui/core/Paper';
import Stepper from '@material-ui/core/Stepper';
import Step from '@material-ui/core/Step';
import StepLabel from '@material-ui/core/StepLabel';
import Button from '@material-ui/core/Button';
import Link from '@material-ui/core/Link';
import Typography from '@material-ui/core/Typography';
import Identificacion from './datosextra/Datos1';
import Facturacion from './datosextra/Datos2';
import Perfil from './datosextra/Datos3';
import InputLabel from '@material-ui/core/InputLabel';
import Select from '@material-ui/core/Select';


const useStyles = makeStyles((theme) => ({
  appBar: {
    position: 'relative',
  },
  layout: {
    width: 'auto',
    marginLeft: theme.spacing(2),
    marginRight: theme.spacing(2),
    [theme.breakpoints.up(600 + theme.spacing(2) * 2)]: {
      width: 600,
      marginLeft: 'auto',
      marginRight: 'auto',
    },
  },
  paper: {
    marginTop: theme.spacing(3),
    marginBottom: theme.spacing(3),
    padding: theme.spacing(2),
    [theme.breakpoints.up(600 + theme.spacing(3) * 2)]: {
      marginTop: theme.spacing(6),
      marginBottom: theme.spacing(6),
      padding: theme.spacing(3),
    },
  },
  stepper: {
    padding: theme.spacing(3, 0, 5),
  },
  buttons: {
    display: 'flex',
    justifyContent: 'flex-end',
  },
  button: {
    marginTop: theme.spacing(3),
    marginLeft: theme.spacing(1),
  },
}));

const steps = ['Identificación', 'Facturación', 'Datos de perfil'];
const tipofac = 'personal'
function getStepContent(step) {
  switch (step) {
    case 0:
      return <Identificacion />;
    case 1:
      return <Facturacion />;
    case 2:
      console.log(tipofac)
      return <Perfil />;
    default:
      throw new Error('Unknown step');
  }
}

export default function  Datosextra() {
  const classes = useStyles();
  const [activeStep, setActiveStep] = React.useState(0);

  const handleNext = () => {
    setActiveStep(activeStep + 1);
  };

  const handleBack = () => {
    setActiveStep(activeStep - 1);
  };
  return (
    <React.Fragment>
      <CssBaseline />
      <AppBar position="absolute" color="default" className={classes.appBar}>
        <Toolbar>
          <Typography variant="body1" color="inherit" noWrap>
            En esta sección podrás completar la información de tu perfil, puedes guardar los cambios de cada sección en el momento que desees...
          </Typography>
        </Toolbar>
      </AppBar>
      <main className={classes.layout}>
        <Paper className={classes.paper}>
          <Typography component="h1" variant="h4" align="center">
            Formulario de Datos Personales
          </Typography>
          <Stepper activeStep={activeStep} className={classes.stepper}>
          {steps.map((label) => (
            <Step key={label}>
              <StepLabel>{label}</StepLabel>
            </Step>
          ))}
          </Stepper>
          <React.Fragment>
          {activeStep === steps.length ? (
            <React.Fragment>
            <Typography variant="h5" gutterBottom>
              ¡Bien Hecho!, Haz completado tu información.
            </Typography>
            <Typography variant="subtitle1">
              Revisaremos tus datos, pronto nos pondremos en contacto contigo.
            </Typography>
            </React.Fragment>
            ) : (
            <React.Fragment>
              {getStepContent(activeStep)}
                <div className={classes.buttons}>
                {activeStep !== steps.length-1 && (
                <Button className={classes.button} color="default">
                  Guardar Cambios
                </Button>
                )}
                {activeStep !== 0 && (
                  <Button onClick={handleBack} className={classes.button}>
                    Atrás
                  </Button>
                  )}
                  <Button
                  variant="contained"
                  color="primary"
                  onClick={handleNext}
                  className={classes.button}
                  >
                  {activeStep === steps.length - 1 ? 'Terminar' : 'Siguiente'}
                  </Button>
                </div>
            </React.Fragment>
              )}
          </React.Fragment>
        </Paper>
      </main>
    </React.Fragment>
  );
}
WebpackerReact.setup({Datosextra})

