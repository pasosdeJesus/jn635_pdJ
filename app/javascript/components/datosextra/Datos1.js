import React from 'react';
import Grid from '@material-ui/core/Grid';
import { makeStyles } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import TextField from '@material-ui/core/TextField';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Checkbox from '@material-ui/core/Checkbox';
import InputLabel from '@material-ui/core/InputLabel';
import Select from '@material-ui/core/Select';
import NativeSelect from '@material-ui/core/NativeSelect';
import FormControl from '@material-ui/core/FormControl';
import Button from '@material-ui/core/Button';

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

export default function Datos1() {
    const classes = useStyles();
    const [state, setState] = React.useState({
          age: '',
          name: 'hai',
        });

    const handleChange = (event) => {
          const name = event.target.name;
          setState({
                  ...state,
                  [name]: event.target.value,
                });
        };
    return (
          <React.Fragment>
            <Typography variant="h6" gutterBottom>
              Identificación
            </Typography>
            <Grid container spacing={3}>
              <Grid item xs={12} sm={6}>
                <TextField
                  required
                  id="primerNombre"
                  name="primerNombre"
                  label="Primer Nombre"
                  fullWidth
                  autoComplete="given-name"
                />
              </Grid>
              <Grid item xs={12} sm={6}>
                <TextField
                  required
                  id="apellido"
                  name="apellido"
                  label="Apellido"
                  fullWidth
                  autoComplete="family-name"
                />
              </Grid>
              <Grid item xs={12} sm={6}>
               <FormControl>
                <InputLabel htmlFor="tipoId-native-simple">Tipo de Identificación</InputLabel>
                <Select
                  required
                  native
                  value={state.age}
                  onChange={handleChange}
                  inputProps={{
                                name: 'tipoId',
                                  id: 'tipoId-native-simple',
                                }}
                >
                  <option aria-label="None" value="" />
                  <option value={10}>Cédula de Ciudadanía</option>
                  <option value={20}>Tarjeta de Identidad</option>
                  <option value={30}>Pasaporte</option>
                </Select>
              </FormControl>
              </Grid>
              <Grid item xs={12} sm={6}>
                <TextField
                  required
                  id="numIdentificacion"
                  name="numIdentificacion"
                  label="Número de Identiicación"
                  fullWidth
                  autoComplete="shipping address-line1"
                />
              </Grid>
              <Grid item xs={12} sm={6}>
              <input
                className={classes.input}
                accept=".pdf,.doc"
                id="identificacion-button-file"
                multiple
                type="file"
               />
               <label htmlFor="identificacion-button-file">
                <Button required color="primary" component="span">
                  Subir Documento
                </Button>
               </label>
              </Grid>
            </Grid>
          </React.Fragment>
        );
}
