import React from 'react';
import Typography from '@material-ui/core/Typography';
import Grid from '@material-ui/core/Grid';
import TextField from '@material-ui/core/TextField';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Checkbox from '@material-ui/core/Checkbox';
import Radio from '@material-ui/core/Radio';
import RadioGroup from '@material-ui/core/RadioGroup';
import FormControl from '@material-ui/core/FormControl';
import FormLabel from '@material-ui/core/FormLabel';



export default function Datos2(props) {
  
    const [value, setValue] = React.useState('personal');
    const handleChange = (event) => {
          setValue(event.target.value);
        };

  return (
          <React.Fragment>
            <Typography variant="h6" gutterBottom>
              Facturación
            </Typography>
            <br />
            <Grid container spacing={3}>
              <FormLabel component="legend">Tipo de Facturación</FormLabel>
              <Grid item xs={12}>
               <FormControl component="fieldset">
                  <RadioGroup aria-label="tipoFacturacion" name="tipoFacturacion" value={value} onChange={handleChange}>
                    <FormControlLabel value="personal" control={<Radio color="primary"/>} label="Personal" />
                    <FormControlLabel value="empresa" control={<Radio color="primary"/>} label="Empresa" />
                  </RadioGroup>
                </FormControl>
              </Grid>
              
              <FormLabel component="legend">Dirección de Facturación</FormLabel>
              <Grid item xs={12} md={6}>
                <TextField
                  required
                  id="pais"
                  label="País"
                  fullWidth
                  autoComplete="pais"
                />
              </Grid>
              <Grid item xs={12} md={6}>
                <TextField
                  required
                  id="departamento"
                  label="Departamento/Estado/Provincia"
                  fullWidth
                  autoComplete="departamento"
                />
              </Grid>
              <Grid item xs={12} sm={6}>
                <TextField
                  required
                  id="ciudad"
                  name="ciudad"
                  label="Ciudad"
                  fullWidth
                  autoComplete="ciudad"
                />
              </Grid>
              <Grid item xs={12} sm={6}>
                 <TextField
                   required
                   id="zip"
                   name="zip"
                   label="Zip / Código Postal"
                   fullWidth
                   autoComplete="shipping postal-code"
                 />
              </Grid>
              <Grid item xs={12} sm={6}>
                 <TextField
                   required
                   id="sector"
                   name="sector"
                   label="Sector"
                   helperText="Varía según tipo de facturación"
                   fullWidth
                   autoComplete="sector"
                 />
              </Grid>
            </Grid>
          </React.Fragment>
        );
}
