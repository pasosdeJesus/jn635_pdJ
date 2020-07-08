import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import Grid from '@material-ui/core/Grid';
import FormLabel from '@material-ui/core/FormLabel';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';

const useStyles = makeStyles((theme) => ({
    root: {
          '& > *': {
                  margin: theme.spacing(1),
                },
        },
    input: {
          display: 'none',
        },
}));


export default function Review() {

  const classes = useStyles();
  return (
    <React.Fragment>
    <div>
    <Typography variant="h6" gutterBottom>
      Perfil
    </Typography>
    <br />
    <FormLabel component="legend">
    En caso de ser estudiante adjunte certificación de que es estudiante de su universidad (el correo institucional basta) o si es investigador, carta de líder de su investigación con logotipo de la universidad dirigida a CINEP con un resumen del propósito de la investigación.
    </FormLabel>
    <Grid container spacing={3}> 
      <Grid item xs={12} sm={6}>
      <input
        className={classes.input}
        accept=".pdf,.doc"
        id="estudiante-investigador-file"
        multiple
        type="file"
       />
       <label htmlFor="estudiante-investigador-file">
        <Button required color="primary" component="span">
          Subir Documento
        </Button>
       </label>
      </Grid>
    </Grid>
    </div>
    <div>
    <Grid container spacing={3}> 
      <Grid item xs={12}>
       <TextField
         id="url"
         name="url"
         label="URL donde publicará su investigación"
         fullWidth
         autoComplete="family-name"
       />
      </Grid>
      <Grid item xs={12} sm={6}>
        <TextField
          required
          id="sectorsocial"
          name="sectorsocial"
          label="Sector Social"
          fullWidth
          autoComplete="family-name"
        />
      </Grid>
      <Grid item xs={12} sm={6}>
        <TextField
          required
          type= "number"
          id="nit"
          name="nit"
          label="Nit"
          fullWidth
          autoComplete="family-name"
        />
      </Grid>
      <Grid item xs={12} sm={6}>
        <TextField
          required
          id="apellidoRepresentante"
          name="apellidoRepresentante"
          label="Apellido Representante Legal"
          fullWidth
          autoComplete="family-name"
        />
      </Grid>
      <Grid item xs={12} sm={6}>
        <TextField
          required
          id="nombreRepresentante"
          name="nombreRepresentante"
          label="Nombre Representante Legal"
          fullWidth
          autoComplete="family-name"
        />
      </Grid>
      <Grid item xs={12} sm={6}>
      <FormLabel component="legend">
        Adjuntar certificado de Cámara de Comercio
      </FormLabel>
      <input
        className={classes.input}
        accept=".pdf,.doc"
        id="camaracomercio-file"
        multiple
        type="file"
       />
       <label htmlFor="camaracomercio-file">
        <Button required color="primary" component="span">
          Subir Documento
        </Button>
       </label>
      </Grid>
    </Grid>
    </div>
    </React.Fragment>
  );
}
